# Maintainer: Leia <waste at mrtino dot eu>

pkgname=badwolf
pkgver=1.2.2
pkgrel=2
pkgdesc="A minimalist and privacy-oriented WebKitGTK+ browser."
url="https://hacktivis.me/projects/badwolf"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=('BSD')
#makedepends=('clang') # if you want to use clang instead of gcc, decomment this line and change CC=gcc to CC=clang in the build section
depends=('webkit2gtk')
source=("https://hacktivis.me/releases/$pkgname-$pkgver.tar.gz")
sha512sums=('0f7bd28ab9bae51323082bad172914009ba979cc9f990a782f7f032ca65589284708ffcaa530f737ecd3d00b580000988b5d18fbb2643ce0df3bc001a58ef611')
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
