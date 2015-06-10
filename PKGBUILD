# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-pypdf2
pkgver=1.24
pkgrel=1
pkgdesc="PDF toolkit"
arch=('any')
url="http://mstamy2.github.com/PyPDF2"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/P/PyPDF2/PyPDF2-$pkgver.tar.gz)

build() {
  cd "$srcdir/PyPDF2-$pkgver"
  python setup.py build
}

package(){
  cd "$srcdir/PyPDF2-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:ts=2:sw=2:et:
md5sums=('87cbb41c24bd98e6f70a37bb4a97446c')
