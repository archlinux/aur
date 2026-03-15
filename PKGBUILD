# Maintainer: Devel <Denislav08@proton.me>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: aksr <aksr at t-com dot me>
pkgname=siren
pkgver=0.11
pkgrel=1
pkgdesc="A text-based audio player."
arch=(i686 x86_64)
url="http://www.kariliq.nl/siren/"
license=('custom:ISC')
depends=('ncurses')
optdepends=('alsa-lib: alsa support'
            'faad2: AAC format support'
            'ffmpeg: ffmpeg input'
            'flac: flac input support'
            'libao: audio output support'
            'libid3tag: id3 tags support'
            'libmad: MPEG-1/2/2.5 decoder support'
            'libmp4v2: MP4, AAC'
            'libpulse: pulseaudio support'
            'libsndfile: sndfile input plugin'
            'libvorbis: Ogg Vorbis audio format'
            'opusfile: Opus audio format'
            'oss: OSS 3/4 output plugin'
            'portaudio: PortAudio support'
            'sndio: sndio output plugin'
            'wavpack: WavPack audio format')
source=("http://www.kariliq.nl/siren/dist/$pkgname-$pkgver.tar.gz")
sha256sums=('c9d80b81a90172a2140b1517122efc7ed8b876dadd88fcb582845d1b52b2edaf')
build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure prefix=/usr mandir=/usr/share/man
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -D -m644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

