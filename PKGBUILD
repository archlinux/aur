# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=python-opengl-accelerate
pkgver=3.1.7
pkgrel=1
pkgdesc="This is the Cython-coded accelerator module for PyOpenGL 3.x"
_name=PyOpenGL-accelerate
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
#source=("https://github.com/mcfletch/${_name}/archive/${_commit}.tar.gz")
source=($pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('2b123621273a939f7fd2ec227541e399f9b5d4e815d69ae0bdb1b6c70a293680')

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
