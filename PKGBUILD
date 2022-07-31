# Maintainer: mark.blakeney at bullet-systems dot net
# Contributor: Yuanji <self@gimo.me>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

_name=PyPDF2
pkgname=python-pypdf2
pkgver=2.9.0
pkgrel=1
pkgdesc='A pure-python PDF library for splitting, merging, cropping, and transforming pages of PDF files'
arch=(any)
url="https://github.com/py-pdf/$_name"
license=(BSD)
depends=(python)
makedepends=(python-setuptools)
source=($pkgname-$pkgver.tar.gz::"https://github.com/py-pdf/$_name/archive/$pkgver.tar.gz")
sha256sums=('650a7599b2c7b485a525a421136b64a1061f127c2c5c73e761177e62d295555b')

build() {
  cd $_name-$pkgver
  python setup.py build
}

package(){
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
