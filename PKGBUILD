# Maintainer: mark.blakeney at bullet-systems dot net
# Contributor: Yuanji <self@gimo.me>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

_name=PyPDF2
pkgname=python-pypdf2
pkgver=2.6.0
pkgrel=1
pkgdesc='A pure-python PDF library for splitting, merging, cropping, and transforming pages of PDF files'
arch=(any)
url="https://github.com/py-pdf/$_name"
license=(BSD)
depends=(python)
makedepends=(python-setuptools)
source=($pkgname-$pkgver.tar.gz::"https://github.com/py-pdf/$_name/archive/$pkgver.tar.gz")
sha256sums=('24848d28fb84caf793b7e465032a39747bf9484488c095a36b95e7608f650c56')

build() {
  cd $_name-$pkgver
  python setup.py build
}

package(){
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
