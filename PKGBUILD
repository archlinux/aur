# Maintainer: Alexander Shibaev <sashashibaev@gmail.com>
pkgname=ktrain
pkgver=0.0.0
pkgrel=1
pkgdesc="A terminal-based typing trainer"
arch=('any')
url="https://github.com/woowgers/ktrain"
license=('MIT')
depends=()
source=("$pkgname-v$pkgver.tar.gz::https://github.com/woowgers/ktrain/archive/v$pkgver.tar.gz")
sha256sums=('c34a6448826038c4ab2f004a96ad3086c1ff2ef8ad81e18acaabb14bb38b64f4')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 ktrain "$pkgdir/usr/bin/ktrain"
  mkdir -p "$pkgdir/usr/share/ktrain"
  cp -r "$srcdir/$pkgname-$pkgver/text" "$pkgdir/usr/share/ktrain" 
}

