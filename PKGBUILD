# Maintainer: Spencer Muise <smuise@spencermuise.ca>

pkgname=python-mpv-jsonipc-git
_name=python-mpv-jsonipc
provides=('python-mpv-jsonipc')
pkgver=v1.1.7.r3.g4a2371d
pkgrel=1
pkgdesc="Python API to MPV using JSON IPC"
arch=('any')
url='https://github.com/iwalton3/python-mpv-jsonipc'
license=('GPL3')
depends=(
  'python'
)
makedepends=(
  'git'
  'python-setuptools'
)
source=("git+https://github.com/iwalton3/$_name.git")
sha256sums=('SKIP')

pkgver() {
  cd $_name
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $_name
    python setup.py build
}

package() {
    cd $_name
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
