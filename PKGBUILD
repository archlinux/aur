# Maintainer: Alex Merry <dev@randomguy3.me.uk>

pkgname=get_iplayer
pkgver=3.26
pkgrel=1
pkgdesc="Allows you to download or stream any iPlayer programme from the BBC in H.264 (Quicktime/mp4) format, any radio programmes in MP3 or RealAudio format"
arch=('any')
url="https://github.com/get-iplayer/get_iplayer/"
license=('GPL3')
depends=(
    'perl>=5.10.1'
    'perl-json-pp' # part of perl from 5.14 onwards
    'perl-lwp-protocol-https' # Basic access to servers
    'perl-libwww' # Basic access to servers
    'perl-xml-libxml'  # Page scraping and subtitles
    'perl-mojolicious') # Fetching indexes
optdepends=(
    'atomicparsley: add tags to MP4 files'
    'ffmpeg: convert flash (flv) files'
    'perl-cgi: web PVR manager')
install=get_iplayer.install
source=(https://github.com/get-iplayer/get_iplayer/archive/v${pkgver}.tar.gz)
md5sums=('425901e2ff6742386eeb9f8aa3661b30')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -m755 -D get_iplayer $pkgdir/usr/bin/get_iplayer
    install -m755 -D get_iplayer.cgi $pkgdir/usr/bin/get_iplayer.cgi

    install -m644 -D README.md $pkgdir/usr/share/doc/get_iplayer/README.md

    install -D -m644 get_iplayer.1 ${pkgdir}/usr/share/man/man1/get_iplayer.1
}

# vim:set ts=4 sw=4 et:
