# Maintainer: olddog <jeff@impcode.com>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=pg_activity
pkgver=1.5.0
pkgrel=2
pkgdesc="Is a top like application for PostgreSQL server activity monitoring"
arch=('any')
url="https://github.com/julmon/pg_activity/"
license=('BSD')
depends=('python' 'python-psutil' 'python-psycopg2')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/julmon/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('1e4b0da782e8fd58c7a49e6dbb88c2cb')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1

  # install LICENSEfile
  install -D -m 0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
