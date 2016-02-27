# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=mp4joiner
pkgver=3.2
pkgrel=1
pkgdesc="A collection of cross-platform free tools to manipulate MP4 files."
arch=('i686' 'x86_64')
url="http://www.mp4joiner.org/"
license=('GPL')
makedepends=('gpac')
depends=('wxsvg>=1.1.13' 'desktop-file-utils')
source=('mp4joiner.desktop' "MP4Tools-$pkgver.tar.bz2::http://sourceforge.net/projects/mp4joiner/files/MP4Tools/$pkgver/MP4Tools-$pkgver.tar.bz2/download?nowrap")
md5sums=('74f6b25d675f138700af9b8b2491f506' '9b128dc08e5467ead1c2ec6bc738ed34')
install=$pkgname.install

build() {
  cd MP4Tools-$pkgver
  ./configure --prefix=/usr && make
}

package() {
  cd MP4Tools-$pkgver
  install -Dm644 $srcdir/mp4joiner.desktop $pkgdir/usr/share/applications/mp4joiner.desktop
  install -Dm644 resources/mp4joiner.png $pkgdir/usr/share/icons/hicolor/48x48/apps/mp4joiner.png
  make DESTDIR="$pkgdir/" install
}