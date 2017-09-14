# Maintainer: Thor77 <thor77 at thor77 dot org>
# Contributor: Manuel Fill <manuel.fill.42@gmail.com> 

pkgname=whistle-git
pkgver=0.9.3.r1.g7c27ef1
pkgrel=1
pkgdesc="a curses-based commandline audio (mp3/ogg/flac) player"
arch=('i686' 'x86_64')
url="https://github.com/ap0calypse/whistle"
license=('MIT')
depends=('perl-curses-ui' 'perl-mp3-info' 'perl-file-mimeinfo' 'mplayer' 'perl-ogg-vorbis-header-pureperl' 'perl-audio-flac-header' 'perl-libwww')
makedepends=('git')
source=("$pkgname"::'git://github.com/ap0calypse/whistle.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	# Use the tag of the last commit
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 "$srcdir/$pkgname/whistle" "$pkgdir/usr/bin/whistle"
}
