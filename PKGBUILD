# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=flac2mp3-git
pkgver=r165.16da5f5
pkgrel=2
pkgdesc="a perl script to convert FLAC files to MP3 format"
arch=('any')
url="https://github.com/robinbowes/flac2mp3"
license=('GPL')
depends=('perl' 'perl-data-dump' 'perl-file-find-rule' 'perl-audio-flac-header' 'perl-file-which' 'perl-mp3-tag' 'perl-proc-parallelloop' 'perl-parallel-forkmanager')
source=("${pkgname}"::'git://github.com/robinbowes/flac2mp3')
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	mkdir -p $pkgdir/usr/share/doc/flac2mp3
	cd $srcdir/${pkgname}
	install -Dm 755 ./flac2mp3.pl $pkgdir/usr/bin/flac2mp3.pl
	install -Dm 644 ./*.txt $pkgdir/usr/share/doc/flac2mp3/
}
