# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname='python-doublex-expects'
pkgver=0.7.1
pkgrel=8
pkgdesc="Expects matchers for Doublex test doubles assertions"
arch=('any')
license=('Apache')
url="https://github.com/jaimegildesagredo/doublex-expects"
depends=('python-doublex' 'python-expects')
makedepends=('python-setuptools')
checkdepends=('python-mamba')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jaimegildesagredo/doublex-expects/archive/v$pkgver.tar.gz")
sha512sums=('2aaff2e58556ed9eb91ebb418e65058367411e011e843afb5adb08ab69705b6bdfb478d3052aae093ad1c1a1b49ba1e084e4c5510acde4874182a658330e3448')

build() {
  cd doublex-expects-$pkgver
  python setup.py build
}

check() {
  cd doublex-expects-$pkgver
  mamba
}

package() {
  cd doublex-expects-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
