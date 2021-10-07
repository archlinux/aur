# Maintainer: Leia <waste at mrtino dot eu>

pkgname=badwolf
pkgver=1.2.0
pkgrel=4
pkgdesc="A minimalist and privacy-oriented WebKitGTK+ browser."
url="https://hacktivis.me/projects/badwolf"
arch=('i686' 'x86_64' 'armv7h')
license=('custom')
#makedepends=('clang') # if you want to use clang instead of gcc, decomment this line and change CC=gcc to CC=clang in the build section
depends=('webkit2gtk')
source=("https://hacktivis.me/releases/$pkgname-$pkgver.tar.gz")
sha512sums=('ccf0eb25630438ba783ae7e6d30b0c516290966199bbe36f76b22f2091c3a2940676ee0fb0a5cf46a9cb258e7979084d6f34662f7252c1b37ec0cee7c9958fb0')
changelog=changelog

build() {
  cd "$pkgname-$pkgver"
  PREFIX=/usr ./configure
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
