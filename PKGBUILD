# Maintainer: olddog <jeff@impcode.com>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=pg_activity
pkgver=3.3.0
pkgrel=1
pkgdesc="Is a top like application for PostgreSQL server activity monitoring"
arch=('any')
url="https://github.com/dalibo/pg_activity/"
license=('BSD')
depends=('python>=3.7' 'python-psutil>=2.0.0'  'python-psycopg2>=2.8' 'python-pytest' 'python-blessed' 'python-humanize' )
makedepends=('python-setuptools')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('8b5b8bdf20b31dbe4afc387d3737d529')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1

  # install LICENSEfile
  install -D -m 0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
