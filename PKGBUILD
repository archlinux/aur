# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=mp4joiner
pkgver=3.8
pkgrel=1
pkgdesc="A collection of cross-platform free tools to manipulate MP4 files."
arch=('i686' 'x86_64')
url="http://www.mp4joiner.org/"
license=('GPL')
makedepends=('gpac')
depends=('wxgtk2>=2.8.7' 'wxsvg>=1.1.13')
source=('mp4joiner.desktop' "MP4Tools-$pkgver.tar.bz2::http://sourceforge.net/projects/mp4joiner/files/MP4Tools/$pkgver/MP4Tools-$pkgver.tar.bz2/download?nowrap")
sha256sums=('00b6c08644c335340e5bd433606efe9ba6bcbe235390c486cced15462ac257af' '6a64d4c02b84affb6b6e1f17aaca78a41d319576b7f428b50b55a6ba2ce64b3e')

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
