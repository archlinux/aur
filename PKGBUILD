# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>

_name=wcag-contrast-ratio
pkgname=python38-$_name
pkgver=0.9
pkgrel=1
pkgdesc="Library for computing contrast ratios, as required by WCAG 2.0"
arch=('any')
url="https://github.com/gsnedders/wcag-contrast-ratio"
license=('MIT')
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest' 'python38-hypothesis')
source=(https://github.com/gsnedders/wcag-contrast-ratio/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('5263b7b2d0f5a8de2eb409421284947df6229b67bca0055fa10da38153835815')

build() {
  cd $_name-$pkgver
  python3.8 setup.py build
}

check() {
  cd $_name-$pkgver
  pytest test.py
}

package() {
  cd $_name-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:
