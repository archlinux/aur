pkgname=hardword
pkgver=0.1.0
pkgrel=2
pkgdesc="Write documents"
arch=('x86_64')
url="https://github.com/Archetylator/hardword"
license=('custom')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("${url}/releases/download/app-v${pkgver}/Hardword_${pkgver}_amd64.deb")
sha256sums=('SKIP')
package() {
    cd "$srcdir"

    # extract deb
    bsdtar -xf Hardword_${pkgver}_amd64.deb

    # extract actual app payload
    bsdtar -xf data.tar.*

    # copy into package directory
    cp -r usr "$pkgdir/"
}

