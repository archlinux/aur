# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=threemaqt
pkgver=1.0.3
pkgrel=1
pkgdesc='Unofficial Threema Web desktop client'
arch=('x86_64')
url='https://gitlab.com/bit3/threemaqt'
license=('MIT')
depends=('qt5-webengine')
source=("https://gitlab.com/bit3/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('3b56e2068d1cddaa7087658d66691de271ac1c6981e3290296a4ea0ee8af05f3')

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
