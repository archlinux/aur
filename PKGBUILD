# Contributor: Jaroslav Lichtblau (Dragonlord) <dragonlord@aur.archlinux.org>

pkgname=shn2make
pkgver=2.15
pkgrel=1
pkgdesc="A tool for working with sets of shn and flac audio files - automate the process of burning shn archive CD-R's, audio CD-R's and the encoding of lossy mp3 and ogg-vorbis files."
arch=('i686')
url="http://freeengineer.org/shn2make.html"
license=('GPL')
depends=('perl' 'shorten' 'flac' 'lame' 'vorbis-tools' 'cdrtools')
source=(ftp://ftp.freeengineer.org/pub/$pkgname/$pkgname-$pkgver.tar.gz \
        Makefile.diff)

md5sums=('3e2f47a48673aea1fe3458547cd52108'
         'af5bd95670a355469a20ce6e8ff90c83')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  echo 'startdir='$startdir >> Makefile || return 1
  patch -Np0 -i "$srcdir/Makefile.diff" || return 1

  make install || return 1
  chmod +x "$pkgdir/usr/bin/$pkgname" || return 1
}
