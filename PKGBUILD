# Maintainer: Pierre-Gildas MILLON <pgmillon@gmail.com>

pkgname=python2-tld
pkgver=0.7.9
pkgrel=1
pkgdesc="Extracts the top level domain (TLD) from the URL given"
arch=('any')
url="https://github.com/barseghyanartur/tld"
license=('GPL')
depends=(
  'python2'
  'python2-six'
  )
makedepends=('python2-setuptools')
source=("https://github.com/barseghyanartur/tld/archive/$pkgver.tar.gz")
md5sums=('31df727ec2035dbaf0b1acd13b17dcc6')

build() {
  cd "${srcdir}/tld-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/tld-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
