# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=whatsappqt
pkgver=1.0.1
pkgrel=1
pkgdesc='Unofficial WhatsApp Web desktop client'
arch=('x86_64')
url='https://gitlab.com/bit3/whatsappqt'
license=('MIT')
depends=('qt5-webengine')
#makedepends=('qt5-tools')
source=("https://gitlab.com/bit3/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('67b108bbdf00b2d4120575a570ce31cc8e03b628c8986bd5f033b90edea089be')

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
