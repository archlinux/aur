# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=flac2mp3-git
pkgver=1.0.0.r5.g101330e
pkgrel=1
pkgdesc="a perl script to convert FLAC files to MP3 format"
arch=('any')
url="https://github.com/robinbowes/flac2mp3"
license=('GPL')
depends=('perl' 'perl-data-dump' 'perl-file-find-rule' 'perl-audio-flac-header' 'perl-file-which' 'perl-mp3-tag' 'perl-proc-parallelloop' 'perl-parallel-forkmanager')
makedepends=('git')
source=("${pkgname}"::'git+https://github.com/robinbowes/flac2mp3')
md5sums=(SKIP)

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	mkdir -p $pkgdir/usr/share/doc/flac2mp3
	cd $srcdir/${pkgname}
	install -Dm 755 ./flac2mp3.pl $pkgdir/usr/bin/flac2mp3.pl
	install -Dm 644 ./*.txt $pkgdir/usr/share/doc/flac2mp3/
}
