# Maintainer: Christopher Reimer <mail[plus]aur[at]c-reimer[dot]de>
pkgname=mp3fs
pkgver=1.0
pkgrel=1
pkgdesc="FUSE-based transcoding filesystem from FLAC to MP3"
arch=('i686' 'x86_64')
url="http://khenriks.github.com/mp3fs"
license=('GPL3')
depends=('flac' 'fuse' 'lame' 'libid3tag' 'libvorbis')
source=("https://github.com/khenriks/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('1f023906e35732c02e0bf236e3398873')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
