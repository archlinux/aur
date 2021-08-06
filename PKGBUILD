# Maintainer: olddog <jeff@impcode.com>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=pg_activity
pkgver=2.2.0
pkgrel=2
pkgdesc="Is a top like application for PostgreSQL server activity monitoring"
arch=('any')
url="https://github.com/dalibo/pg_activity/"
license=('BSD')
depends=('python>=3.6' 'python-psutil>=2.0.0'  'python-psycopg2>=2.8' 'python-pytest' 'python-blessed' 'python-humanize' )
makedepends=('python-setuptools')
options=(!emptydirs)
source=("${url}/archive/v${pkgver}.zip")
md5sums=('51c4c482908b2608e81effd402b81ffd')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1

  # install LICENSEfile
  install -D -m 0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
