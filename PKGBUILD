# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=pg_activity
pkgver=1.1.1
pkgrel=1
pkgdesc="Application similar to top for PostgreSQL server activity monitoring"
arch=('any')
url="https://github.com/julmon/pg_activity/"
license=('BSD')
depends=('python2' 'python2-psutil' 'python2-psycopg2')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("https://github.com/julmon/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('39ee16af2da17a3edb14bc4cf59f12c6')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -D -m 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
