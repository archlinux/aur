# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python-colour
_pyname=colour
pkgver=0.1.2
pkgrel=1
pkgdesc="Colour representations manipulation library (RGB, HSL, web, ...)"
arch=('i686' 'x86_64')
url="https://github.com/vaab/colour"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
# autogen.sh requires git metadata, so a tarball isn't useful.
source=("git+https://github.com/vaab/$_pyname#tag=$pkgver")
md5sums=('SKIP')

package() {
  cd "${srcdir}/$_pyname"
  python setup.py install --root "${pkgdir}"

  # Only available on master, not in latest stable:
  #install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
