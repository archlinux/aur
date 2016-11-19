# Maintainer: Alex Merry <dev@randomguy3.me.uk>

pkgname=get_iplayer
pkgver=2.97
pkgrel=1
pkgdesc="Allows you to download or stream any iPlayer programme from the BBC in H.264 (Quicktime/mp4) format, any radio programmes in MP3 or RealAudio format"
arch=('any')
url="http://www.infradead.org/get_iplayer/html/get_iplayer.html"
license=('GPL3')
depends=(
    'perl-libwww'
    'perl-html-parser'
    'perl-www-mechanize'
    'perl-http-cookies'
    'perl-net-http'
    'perl-xml-simple')
optdepends=(
    'rtmpdump: record high-quality flash-based content'
    'flvstreamer: download files that are in flash (flv) format'
    'ffmpeg: convert flash (flv) files'
    'atomicparsley: add tags to MP4 files'
    'id3v2: add basic tags to MP3 files (if perl-mp3-tag not installed)'
    'perl-mp3-tag: add tags to MP3 files'
    'perl-xml-libxml: backup parser for BBC feeds')
source=(https://github.com/get-iplayer/get_iplayer/archive/v${pkgver}.tar.gz)
md5sums=('783f5b692e23f5721b2ab2c8eec757ef')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -m755 -D get_iplayer $pkgdir/usr/bin/get_iplayer
    install -m755 -D get_iplayer.cgi $pkgdir/usr/bin/get_iplayer.cgi

    install -m644 -D README.md $pkgdir/usr/share/doc/get_iplayer/README.md

    install -D -m644 get_iplayer.1 ${pkgdir}/usr/share/man/man1/get_iplayer.1
}

# vim:set ts=4 sw=4 et:
