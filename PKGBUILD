# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=arxiv2bib
pkgver=1.0.5
pkgrel=1
pkgdesc="Get a BibTeX entry from an arXiv id number"
arch=('any')
url="http://nathangrigg.github.io/arxiv2bib/"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-mock')
source=(https://github.com/nathangrigg/arxiv2bib/archive/$pkgver.tar.gz)

build() {
  cd "$srcdir/arxiv2bib-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/arxiv2bib-$pkgver"
  nosetests3
}


package(){
  cd "$srcdir/arxiv2bib-$pkgver"
  python setup.py install --root="${pkgdir}"
}

# vim:ts=2:sw=2:et:
md5sums=('63568d0d4a0e78b8851588662b4eddde')
