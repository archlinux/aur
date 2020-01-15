# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=python-opengl-accelerate
pkgver=3.1.5
pkgrel=1
_commit=3e9791ffb4cd4831dae261d6bea3049ce9e78f01 # McFletch does not release bundles on GitHub, there we use commit hashes to get specific versions
pkgdesc="This is the Cython-coded accelerator module for PyOpenGL 3.x"
_name=pyopengl
arch=('any')
url=""
license=('BSD')
groups=()
depends=('python' 'python-opengl')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/mcfletch/${_name}/archive/${_commit}.tar.gz")
sha256sums=('d8547b182938aff99eb202edb94f712127d535611f976bd2aaf72650fcef3531')

build() {
  cd "$srcdir/${_name}-${_commit}/accelerate"
  python setup.py build
}

package() {
  cd "$srcdir/${_name}-${_commit}/accelerate"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
