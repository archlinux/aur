# Maintainer: Vinicius Correa <vinicius dot correa at zoho dot com>
_pkgname=HTSQL-PGSQL
pkgname=python2-htsql-pgsql
pkgver=2.3.3
pkgrel=1
pkgdesc="A Database Query Language (PostgreSQL backend) "
arch=('any')
url="http://htsql.org"
license=('GPL')
depends=('python2' 'python2-htsql' 'python2-pyaml' 'python2-psycopg2' 'python2-setuptools')
makedepends=('git')
optdepends=()
conflicts=()
source=("http://dist.htsql.org/source/${_pkgname}-${pkgver}.tar.gz")
md5sums=('5fa3a89277ae380ee0db17e4ca4241b6')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
