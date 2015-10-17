# Maintainer: Corey Mwamba <contact.me@coreymwamba.co.uk>
pkgname=audio-convert-mod
pkgver=3.46.0b
pkgrel=1
pkgdesc="a simple audio file converter supporting many formats"
arch=('any')
url="http://www.diffingo.com/oss/audio-convert-mod"
license=('GPL')
groups=('multimedia')
depends=('pygtk' 'mutagen')
optdepends=('lame: MP3 support' 'vorbis-tools: Ogg Vorbis support' 'musepack-tools: Musepack support' 'flac: FLAC support' 
'mac: Monkeys Audio support'
'faac: AAC/M4A/MP4 decoding'
'faad: AAC/M4A/MP4 encoding'
'wavpack: Wavpack support'
'a52dec: Dolby Digital decoding'
'ffmpeg: Dolby Digital encoding')
source=(http://www.diffingo.com/downloads/$pkgname/"$pkgname-$pkgver.tar.bz2")


build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}



package() {
	mkdir -p $pkgdir/usr/bin
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR=$pkgdir/usr/bin install
}
md5sums=('ee500c8cdee8923df6cc15d2ea5e137c')
