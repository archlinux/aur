# Maintainer: Carlo Abelli <carlo@abelli.me>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Federico Cinelli <cinelli@aur.archlinux.org>
# Contributor: Thomas Dziedzic  < gostrc at gmail >
# Contributor: Gabriel Martinez < reitaka at gmail dot com >

pkgname=ifuse
pkgver=1.1.4
pkgrel=1
pkgdesc='A fuse filesystem to access the contents of an iPhone or iPod Touch'
url='https://libimobiledevice.org/'
arch=('x86_64')
license=('LGPL2.1')
depends=('libimobiledevice' 'fuse2')
source=("https://cgit.libimobiledevice.org/ifuse.git/snapshot/$pkgname-$pkgver.tar.bz2")
sha256sums=('e324456e64b788951b714d6ee7c2ecb1f6bda2355973548fe49d4a14db5d15fe')

build() {
  cd "$pkgname-$pkgver"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
