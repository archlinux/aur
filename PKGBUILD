# Maintainer: Alex Merry <dev@randomguy3.me.uk>

pkgname=get_iplayer
pkgver=3.25
pkgrel=2
pkgdesc="Allows you to download or stream any iPlayer programme from the BBC in H.264 (Quicktime/mp4) format, any radio programmes in MP3 or RealAudio format"
arch=('any')
url="http://www.infradead.org/get_iplayer/html/get_iplayer.html"
license=('GPL3')
depends=(
    'perl>=5.10.1'
    'perl-json-pp' # part of perl from 5.14 onwards
    'perl-lwp-protocol-https' # Basic access to servers
    'perl-libwww' # Basic access to servers
    'perl-xml-libxml') # Page scraping and subtitles
optdepends=(
    'atomicparsley: add tags to MP4 files'
    'ffmpeg: convert flash (flv) files'
    'perl-cgi: web PVR manager'
    'perl-mojolicious: significantly faster indexing (highly recommended)')
install=get_iplayer.install
source=(https://github.com/get-iplayer/get_iplayer/archive/v${pkgver}.tar.gz)
md5sums=('6c9a2b1b138ffc5b69ee4ecaa76d62d1')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -m755 -D get_iplayer $pkgdir/usr/bin/get_iplayer
    install -m755 -D get_iplayer.cgi $pkgdir/usr/bin/get_iplayer.cgi

    install -m644 -D README.md $pkgdir/usr/share/doc/get_iplayer/README.md

    install -D -m644 get_iplayer.1 ${pkgdir}/usr/share/man/man1/get_iplayer.1
}

# vim:set ts=4 sw=4 et:
