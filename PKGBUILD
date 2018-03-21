# Maintainer: Vinicius Correa <vinicius dot correa at zoho dot com>
_pkgname=HTSQL
pkgname=python2-htsql
pkgver=2.3.3
pkgrel=1
pkgdesc="A comprehensive navigational query language for relational databases."
arch=('any')
url="http://htsql.org"
license=('GPL')
depends=('python2' 'python2-pyaml')
makedepends=('git')
optdepends=()
conflicts=()
source=("http://dist.htsql.org/source/${_pkgname}-${pkgver}.tar.gz")
md5sums=('34fabf3f4dbc578abba27540491185de')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
