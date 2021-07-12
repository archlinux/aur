# Maintainer: olddog <jeff@impcode.com>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=pg_activity
pkgver=2.1.5
pkgrel=1
pkgdesc="Is a top like application for PostgreSQL server activity monitoring"
arch=('any')
url="https://github.com/dalibo/pg_activity/"
license=('BSD')
depends=('python' 'python-psutil'  'python-psycopg2' 'python-pytest' 'python-blessed' 'python-humanize' )
makedepends=('python-setuptools')
options=(!emptydirs)
source=("${url}/archive/v${pkgver}.zip")
md5sums=('7d20e610532a7acef76bf0bfc962d6f2')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --with-man

  # install LICENSEfile
  install -D -m 0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
