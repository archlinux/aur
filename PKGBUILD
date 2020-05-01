# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Federico Cinelli <cinelli@aur.archlinux.org>
# Contributor: Thomas Dziedzic  < gostrc at gmail >
# Contributor: Gabriel Martinez < reitaka at gmail dot com >

pkgname=ifuse
pkgver=1.1.3
pkgrel=6
pkgdesc='A fuse filesystem to access the contents of an iPhone or iPod Touch'
url='https://libimobiledevice.org/'
arch=('x86_64')
license=('LGPL2.1')
depends=('libimobiledevice' 'fuse2')
source=("https://cgit.libimobiledevice.org/ifuse.git/snapshot/$pkgname-$pkgver.tar.bz2")
md5sums=('30740edd3ea13b4361b3f1c09c6291fc')
sha256sums=('ab42b61ed380eb9c44772ba9c5e38420cfc4bd112155e50181d9fd6fd5358852')

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
