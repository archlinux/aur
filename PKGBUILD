# Maintainer: xRemaLx <anton.komolov@gmail.com>
# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname=yandex-pgmigrate
_pkgname=pgmigrate
pkgver=1.0.0
pkgrel=1
pkgdesc="PostgreSQL migrations made easy"
arch=('any')
url="https://github.com/yandex/pgmigrate"
license=('PostgreSQL')
depends=('python' 'python-sqlparse>=0.2.1' 'python-psycopg2>=2.6.2' 'python-yaml>=3.12')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/yandex/pgmigrate/archive/v${pkgver}.zip")
md5sums=('6a1b0dd178c9afe12c4969596f8a686d')
sha256sums=('d90c926196b9701aa4959d36e364f93402aca0a1a2605481072969222b912859')

package()
{
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
