# Maintainer: Jelle van der Waa <jelle@archlinux.org>
pkgname=guetzli
pkgver=1.0.1
pkgrel=1
pkgdesc="Perceptual JPEG encoder"
arch=('x86_64' 'i686')
url="https://github.com/google/guetzli"
license=('Apache')
depends=('libpng')
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('0aba6c7490699fa123d78e2c3b61c5a6ab2660ab4a3d5126f592a667e86f4ca69384e952c9bd20a9527919dae2b412972d9b3e51fc6a6302d4e0cafe81895ef3')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/usr/bin/"
  install -Dm755 bin/Release/guetzli "$pkgdir/usr/bin/"
}
