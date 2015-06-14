# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=mp4joiner
pkgver=2.2
pkgrel=2
pkgdesc="A simple free tool to join multiple MP4 files into one without reencoding and without quality loss."
arch=('i686' 'x86_64')
url="http://www.mp4joiner.org/"
license=('GPL')
makedepends=('gpac')
depends=('wxsvg>=1.1.13' 'desktop-file-utils')
source=('mp4joiner.desktop' "MP4Joiner-$pkgver.tar.bz2::http://sourceforge.net/projects/mp4joiner/files/MP4Joiner/$pkgver/MP4Joiner-$pkgver.tar.bz2/download?nowrap")
md5sums=('74f6b25d675f138700af9b8b2491f506' 'b674c7cd25b546b9f48d73e24597e166')
install=$pkgname.install

build() {
  cd MP4Joiner-$pkgver
  ./configure --prefix=/usr && make
} 

package() {
  cd MP4Joiner-$pkgver
  install -Dm644 $srcdir/mp4joiner.desktop $pkgdir/usr/share/applications/mp4joiner.desktop
  install -Dm644 resources/mp4joiner.png $pkgdir/usr/share/icons/hicolor/48x48/apps/mp4joiner.png
  make DESTDIR="$pkgdir/" install
}