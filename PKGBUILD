# Maintainer: Spencer Muise <smuise@spencermuise.ca>

pkgname=python-mpv-jsonipc
pkgver=1.1.7
pkgrel=1
pkgdesc="Python API to MPV using JSON IPC"
arch=('any')
url='https://github.com/iwalton3/python-mpv-jsonipc'
license=('GPL3')
depends=(
  'python'
)
makedepends=(
  'python-setuptools'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/iwalton3/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('c4c9ae4e60033de02baee53a3692b0b9')

build() {
    cd $pkgname-$pkgver
    python setup.py build
}

package() {
    cd $pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
