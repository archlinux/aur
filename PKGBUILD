# Maintainer: Benjamin L. Merritt <blm768@gmail.com>
pkgname=lectrote-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="The IF interpreter in an Electron shell (binary release)"
arch=('x86_64')
url="https://github.com/erkyrath/lectrote"
license=('MIT')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxtst' 'libxss' 'nss')
makedepends=()
provides=('lectrote')
install=
changelog=
source=(
    "https://github.com/erkyrath/lectrote/releases/download/lectrote-$pkgver/Lectrote-$pkgver-linux-x64.zip"
    "lectrote.desktop"
)
sha256sums=(
    "67ae0d558f9a0bd2bdb9c76ab8e9d3ea89471f7c5ea7e28c63721cbfa4014e52"
    "e7f8337c31734369daccef73ffbd6cf2f961998409edf355341ae13f2f7a5d7c"
)

package() {
    cd Lectrote-linux-x64
    _destdir="$pkgdir/usr/share/lectrote/"
    mkdir -p "$_destdir"
    cp -r * "$_destdir"
    chmod a+x "$_destdir/Lectrote"

    _licensedir="$pkgdir/usr/share/licenses/$pkgname"
    mkdir -p "$_licensedir"
    install -m 0644 LICENSE "$_licensedir"

    mkdir -p "$pkgdir/usr/share/applications"
    install -m 0644 ../lectrote.desktop "$pkgdir/usr/share/applications"
}

