# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=whatsappqt
pkgver=1.0.2
pkgrel=1
pkgdesc='Unofficial WhatsApp Web desktop client'
arch=('x86_64')
url='https://gitlab.com/bit3/whatsappqt'
license=('MIT')
depends=('qt5-webengine')
source=("https://gitlab.com/bit3/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('272dc5bc67252ebfe0fae2fbd09b10afd9045c10922c3c81580480160c72f3cd')

build() {
  cd $pkgname-v$pkgver
  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd $pkgname-v$pkgver
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
