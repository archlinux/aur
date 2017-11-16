# Maintainer:  Izzy

pkgname=linedict
pkgver=1.0
pkgrel=1
pkgdesc="A simple dictionary using Youdao webpage source"
url="https://github.com/WingT/linedict"
arch=('x86_64')
license=('MIT')
depends=('libxinerama' 'libxft' 'freetype2' 'pcre' 'curl')
source=("$pkgname-$pkgver::git+https://github.com/WingT/linedict")
sha256sums=('SKIP')

build() {
  cd $pkgname-$pkgver
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 FREETYPEINC=/usr/include/freetype2
}

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
