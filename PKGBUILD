# Maintainer: Yuanji <self@gimo.me>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=python-pypdf2
pkgver=1.27.12
pkgrel=1
pkgdesc='A pure-python PDF library capable of splitting, merging, cropping, and transforming the pages of PDF files'
arch=(any)
url='https://github.com/py-pdf/PyPDF2'
license=(BSD)
depends=(python)
makedepends=(python-setuptools)
source=($pkgname-$pkgver.tar.gz::"https://github.com/py-pdf/PyPDF2/archive/$pkgver.tar.gz")
sha256sums=('2f953639cc0c2722aac61411c4ba4f03116825946c13cc9d01500a183862632c')

build() {
  cd PyPDF2-$pkgver
  python setup.py build
}

package(){
  cd PyPDF2-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m755 Scripts/pdfcat "$pkgdir"/usr/bin/pdfcat
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
