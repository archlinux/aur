# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=arxiv2bib
pkgver=1.0.8
pkgrel=2
pkgdesc="Get a BibTeX entry from an arXiv id number"
arch=('any')
url="http://nathangrigg.github.io/arxiv2bib/"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-mock')
source=(https://github.com/nathangrigg/arxiv2bib/archive/$pkgver.tar.gz)
md5sums=('268d263800cad636870110a891ccd405')

build() {
  cd arxiv2bib-$pkgver
  python setup.py build
}

check() {
  cd arxiv2bib-$pkgver
  nosetests3
}

package(){
  cd arxiv2bib-$pkgver
  python setup.py install --root="${pkgdir}"
}
