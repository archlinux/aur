# Maintainer: João Gabriel V. Melão <jgvasconcellos22@gmail.com>

pkgname=silex-desktop-v3-bin
pkgver=3.9.0
_pkgver=3.9.0
pkgrel=5
pkgdesc="Silex website builder desktop application"
arch=('x86_64')
url="https://github.com/silexlabs/Silex"
license=('AGPL-3.0-or-later')

options=('!debug')

depends=(
    cairo
    gdk-pixbuf2
    glib2
    gtk3
    hicolor-icon-theme
    libsoup3
    openssl
    webkit2gtk-4.1
)

source=("Silex_${_pkgver}_amd64.deb::https://github.com/silexlabs/Silex/releases/download/v${_pkgver}/Silex_${_pkgver}_amd64.deb")
sha256sums=('1bf233109cd014e7d8c8134a4c843b7addc75ba2ff12f560b99a83860f1a1ac5')

package() {
    cd "$srcdir"

    # Extract the data payload directly from the .deb, no intermediate files
    bsdtar -xOf "Silex_${_pkgver}_amd64.deb" data.tar.gz | bsdtar -xf - -C "$pkgdir"
}

