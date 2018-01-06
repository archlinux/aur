# Maintainer:

pkgname=snapscreenshot
pkgver=1.0.14.3
pkgrel=2
pkgdesc="Screenshot program for Linux text consoles"
arch=('i686' 'x86_64')
url="http://bisqwit.iki.fi/source/snapscreenshot.html"
license=('GPL')
depends=('gcc-libs')
source=("http://bisqwit.iki.fi/src/arch/snapscreenshot-$pkgver.tar.bz2")
sha256sums=('b30ec09f182eb4205066d6640666a94bc453eaa2416e5c435b5a28e396c6fb3f')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's|CPPFLAGS=|CPPFLAGS+= |' Makefile
}

build() {
  cd $pkgname-$pkgver
  make CFLAGS="$CFLAGS" CXXFLAGS="$CXXFLAGS"
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 snapscreenshot "$pkgdir"/usr/bin/snapscreenshot
  install -Dm644 snapscreenshot.1 "$pkgdir"/usr/share/man/man1/snapscreenshot.1
}
