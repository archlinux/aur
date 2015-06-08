# Maintainer: Storm Dragon <stormdragon2976@gmail.com> 

pkgname=python2-xml2dict
pkgver=0.2.1
pkgrel=1
pkgdesc="Python xml to dict parser."
arch=('any')
url="https://pypi.python.org/pypi/XML2Dict/"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/X/XML2Dict/XML2Dict-0.2.1.tar.gz")
md5sums=('a0b1e5f5e8ca4ee724feabfc20253d85')

prepare() {
  cd "${srcdir}/XML2Dict-${pkgver}"
  #package developer forgot to make a README.md file which causes installation to fail...
  touch README.md
}

build() {
  cd "${srcdir}/XML2Dict-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/XML2Dict-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
