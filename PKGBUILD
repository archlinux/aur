# Maintainer: NelloKudo <marshnelloosu@gmail.com>

pkgname=elysia-bin
_pkgname=${pkgname%-bin}
pkgver=0.1
pkgrel=1
pkgdesc="Universal anime game launcher, supporting Wine and Proton"
arch=(x86_64)
url="https://dawn.wine/elysia/elysia"
license=(GPL-3.0-only)
depends=(
    'ffmpeg'        'openssl'
    'freetype2'     'fontconfig'
    'mesa'          'libx11'
    'libxcb'        'alsa-lib'
    'libpulse'      'libwebp'
    'gcc-libs'      'glibc'
    'cairo'         'glib2'
    'pango'         'harfbuzz'
    'librsvg'       'gdk-pixbuf2'
    'libva'         'libdrm'
)
options=(!strip)

source=(
  "$_pkgname::https://dawn.wine/$_pkgname/$_pkgname/releases/download/v$pkgver/$_pkgname"
  "$_pkgname.png::https://dawn.wine/$_pkgname/$_pkgname/raw/tag/v$pkgver/assets/elysia.png"
  "$_pkgname.desktop"
)
sha256sums=('34a9d26a7a3753a8a985a4e5b13ec662eab7bc754a6a39b6c3ae209659b21fd3'
            'a5ad1cc5bdeeb146ad10a71f15b1f59f300200e56bc14276044d693afe80276e'
            'e595a40ad47039e75fbf0e05fd1c85cf7a7a59d57a05769c721b4795f69459f7')

package() {
    cd "$srcdir"

    # Installing script
    install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    # Install pixmap and desktop files
    install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
