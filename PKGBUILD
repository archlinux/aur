# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=python-opengl-accelerate
pkgver=3.1.6
pkgrel=1
_commit=227f9c66976d9f5dadf62b9a97e6beaec84831ca # McFletch does not release bundles on GitHub, therefore we use commit hashes to get specific versions
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
sha256sums=('6b556e5aa2fd6517809e1559593038c99d3318d21155be4de3d18acfef093d40')

build() {
  cd "$srcdir/${_name}-${_commit}/accelerate"
  python setup.py build
}

package() {
  cd "$srcdir/${_name}-${_commit}/accelerate"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
