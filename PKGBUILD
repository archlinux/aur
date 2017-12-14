# Submitter: Hugo Osvaldo Barrera <hugo@barrera.io>
# Maintainer: farwayer <farwayer@gmail.com>

pkgname=python-colour
_pyname=colour
pkgver=0.1.5
pkgrel=2
pkgdesc="Colour representations manipulation library (RGB, HSL, web, ...)"
arch=('i686' 'x86_64')
url="https://github.com/vaab/colour"
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-d2to1')
# autogen.sh requires git metadata, so a tarball isn't useful.
source=("git+https://github.com/vaab/$_pyname#tag=$pkgver")
md5sums=('SKIP')

package() {
  cd "${srcdir}/$_pyname"
  python setup.py install --root "${pkgdir}"

  # Only available on master, not in latest stable:
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
