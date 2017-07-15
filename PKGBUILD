# Maintainer: fenuks

pkgname=ttf-librebaskerville
pkgver=1.0
pkgrel=1
pkgdesc="Libre Baskerville is webfont optimized for web body text (typically 16px). It's based on 1941 ATF Specimens, but it has a taller x height, wider counters and minor contrast that allow it to work on small sizes in any screen."
arch=("any")
# https://github.com/impallari/Libre-Baskerville
url="http://www.impallari.com/projects/overview/libre-baskerville"
license=("custom:OFL")
depends=("fontconfig" "xorg-font-utils")
optdepends=()
makedepends=()  
conflicts=()
# install=$pkgname.install
source=("http://www.impallari.com/media/uploads/prosources/update-86-source.zip")
sha256sums=('67ee4b67d55a8b9a16f234125bb89bffb9842e2b74f2c0e8f8479dde11f288d4')


package() {
    cd "${srcdir}/Libre Baskerville v${pkgver}"
    install -d "$pkgdir/usr/share/fonts/TTF"
    install -m644 LibreBaskerville-{Bold,Italic,Regular}.ttf "$pkgdir/usr/share/fonts/TTF"

    # Licence installation
    # install -d "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
