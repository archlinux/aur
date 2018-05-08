# Maintainer: xRemaLx <anton.komolov@gmail.com>
# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname=yandex-pgmigrate
_pkgname=pgmigrate
pkgver=1.0.3
pkgrel=1
pkgdesc="PostgreSQL migrations made easy"
arch=('any')
url="https://github.com/yandex/pgmigrate"
license=('PostgreSQL')
depends=('python' 'python-sqlparse>=0.2.1' 'python-psycopg2>=2.6.2' 'python-yaml>=3.12')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/yandex/pgmigrate/archive/v${pkgver}.zip")
sha256sums=('1177718572ab8f578fd842f01d0c72456bcd7c50bcd264d7ec2b3806e8cc90b8')

package()
{
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
