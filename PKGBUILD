# Maintainer: mark.blakeney at bullet-systems dot net
# Contributor: Yuanji <self@gimo.me>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

_name=PyPDF2
pkgname=python-pypdf2
pkgver=2.10.9
pkgrel=1
pkgdesc='Python library for splitting, merging, cropping, and transforming pages of PDF files'
arch=(any)
url="https://github.com/py-pdf/$_name"
license=(BSD)
depends=(python)
makedepends=(python-setuptools)
source=($pkgname-$pkgver.tar.gz::"https://github.com/py-pdf/$_name/archive/$pkgver.tar.gz")
sha256sums=('7da36e8e717243abe752e8a07cc45545dcad8491e28860f7e6b71b708534f7fa')

build() {
  cd $_name-$pkgver
  python setup.py build
}

package(){
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
