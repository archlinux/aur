# Maintainer: Rico Beier-Grunwald DL4LM <DL4LM AT DARC DOT DE>

pkgname=js8call-bin
pkgver=3.0.3
pkgrel=1
pkgdesc='Weak-signal messaging application for amateur radio (official AppImage)'
arch=('x86_64')
url='https://js8call.com/'
license=('GPL-3.0-only')
provides=("js8call=$pkgver" "js8call-improved=$pkgver")
conflicts=('js8call' 'js8call-improved')
depends=('fuse2')
optdepends=('pipewire: audio backend supported by upstream'
            'pulseaudio: audio backend supported by upstream')
options=('!strip')

source=(
  "${pkgname}-${pkgver}.AppImage::https://github.com/JS8Call-improved/JS8Call-improved/releases/download/v${pkgver}/JS8Call-v${pkgver}-x86_64.AppImage"
  "js8call_icon-${pkgver}.png::https://raw.githubusercontent.com/JS8Call-improved/JS8Call-improved/v${pkgver}/icons/Unix/js8call_icon.png"
  'js8call'
  'js8call.desktop'
)
sha256sums=('3f89bd821f281c59a9384c08a3ad783ea3b9ac6abf319ce6c0d881c2ecc6e6cd'
            '5d9a946d3c013ca9223042818bbd9b90d1993b37dc45b6462320ec1e2d5b29d8'
            '3c6cab8281ee2803069f89e6fd7dad1ccbeb0c1180a2bba86ce5a51a3fe7740c'
            'f38262e1ac7679ef26095d246e788d76aa1b9a8b3cd84417d631a727b804562c')

package() {
  install -Dm755 "$srcdir/${pkgname}-${pkgver}.AppImage" "$pkgdir/opt/$pkgname/JS8Call.AppImage"
  install -Dm755 "$srcdir/js8call" "$pkgdir/usr/bin/js8call"
  install -Dm644 "$srcdir/js8call.desktop" "$pkgdir/usr/share/applications/js8call.desktop"
  install -Dm644 "$srcdir/js8call_icon-${pkgver}.png" "$pkgdir/usr/share/pixmaps/js8call.png"
}
