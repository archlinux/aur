# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: TDY <tdy@archlinux.info>

pkgname=divxenc
pkgver=1.8.0
pkgrel=1
pkgdesc="An interactive mencoder wrapper to encode DVD/video to FMP4/DivX"
arch=('any')
url="http://divxenc.sourceforge.net/"
license=('GPL')
depends=('lsdvd' 'mplayer')
optdepends=('neroaacenc: AAC+ encoding'
            'vorbis-tools: Ogg Vorbis encoding'
            'ogmtools: OGM muxing; exporting DVD chapters'
            'gpac: AVI->MP4 conversion'
            'mkvtoolnix: AVI->MKV conversion'
            'pv: DVD ISO dumps')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('39e23a0007226e25f62cfa6aac789ff0dcc00a14118bea55e92bf0f659aaf2fb')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 man/$pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 doc/README.$pkgname "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 doc/README.encoding "$pkgdir/usr/share/doc/$pkgname/ENCODING"
}

# vim:set ts=2 sw=2 et:
