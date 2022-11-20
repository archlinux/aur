# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-sybil
pkgver=3.0.1
pkgrel=1
pkgdesc='Automated testing for the examples in your documentation.'
arch=('any')
license=('MIT')
url='https://github.com/cjw296/sybil'
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest')
source=("https://github.com/cjw296/sybil/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('293978eae4a7b2b24f64f062bea79837b15c11dc44716b933f82cae3ed9cf1f306c8c74bba76df2653c3a0d5b7ed5977795e261c8650e07a5b03b41874c88d89')

build() {
  cd sybil-$pkgver
  python3.8 setup.py build
}

check() {
  cd sybil-$pkgver
  python3.8 -m pytest
}

package() {
  cd sybil-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
