# Maintainer: João Gabriel V. Melão <jgvasconcellos22@gmail.com>

pkgname=silex-desktop-v3-bin
pkgver=3.10.0_canary.0
_pkgver=3.10.0-canary.0
pkgrel=1
pkgdesc="Silex website builder desktop application"
arch=('x86_64')
url="https://github.com/silexlabs/Silex"
license=('GPL-3.0-only')

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
sha256sums=('ffb4ffd43dfe05ca79623a040756cd5b604c6379e88c4c1c0ee54b7f79c37acb')

package() {
    cd "$srcdir"

    # Extract the data payload directly from the .deb, no intermediate files
    bsdtar -xOf "Silex_${_pkgver}_amd64.deb" data.tar.gz | bsdtar -xf - -C "$pkgdir"
}
