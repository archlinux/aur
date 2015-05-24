# Maintainer: Christopher Reimer <archlinux[at]creimer[dot]net>
pkgname=mp3fs
pkgver=0.91
pkgrel=1
pkgdesc="FUSE-based transcoding filesystem from FLAC to MP3"
arch=('i686' 'x86_64')
url="http://khenriks.github.com/mp3fs"
license=('GPL3')
depends=('flac' 'fuse' 'lame' 'libid3tag')
source=("https://github.com/khenriks/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('8b1e7543114c2bcc5b8eb9562e15c909')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}