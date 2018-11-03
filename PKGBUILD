# Maintainer: Benjamin L. Merritt <blm768@gmail.com>
pkgname=lectrote-bin
pkgver=1.3.2
pkgrel=1
pkgdesc="The IF interpreter in an Electron shell (pre-compiled binary)"
arch=('x86_64')
url="https://github.com/erkyrath/lectrote"
license=('MIT')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxtst' 'libxss' 'nss')
makedepends=()
provides=('lectrote')
install=lectrote.install
source=(
    "https://github.com/erkyrath/lectrote/releases/download/lectrote-$pkgver/Lectrote-$pkgver-linux-x64.zip"
    "lectrote.desktop"
)
sha256sums=(
    "913e11f1dfeba6ebaa0f800ba78bc1d0d668331cad96d86c5c33a78f724eb0a7"
    "1d8e307dd5401ae0fae9eed80284db9f5f41edc9ff5082f9f5b9e9d1e87edf44"
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

