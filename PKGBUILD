# Maintainer: razingfire <j2r3nkf3j@mozmail.com>
pkgname=ulaa-browser
_pkgname=Ulaa-Browser
pkgver=2.37.3
pkgrel=1
pkgdesc="The web browser from Zoho. Ulaa combines minimal design with sophisticated technology to make the web faster, safer, and easier."
arch=(x86_64)
url="https://ulaa.com"
license=()
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=(ulaa-browser-stable)
conflicts=(ulaa-browser-stable)
replaces=()
backup=()
options=(!debug)
install=
changelog=Changelog
source_x86_64=(${_pkgname}-v${pkgver}-${pkgrel}.deb::https://downloads.zohocdn.com/ulaa-browser/release/linux/stable/${_pkgname}-v${pkgver}-amd64.deb)
noextract=()
sha256sums_x86_64=('944d9a5066023b8e6214e04bde71f52a50e0b42d3619e828b5d1d9a196021385')
validpgpkeys=()

prepare() {
  ar x "${srcdir}/${_pkgname}-v${pkgver}-${pkgrel}.deb"
  tar -xvf data.tar.xz
}

package() {
    install -Dm755 ./opt/zoho.com/ulaa/product_logo_16.png "${pkgdir}/usr/share/icons/hicolor/16x16/apps/ulaa-browser.png"
    install -Dm755 ./opt/zoho.com/ulaa/product_logo_24.png "${pkgdir}/usr/share/icons/hicolor/24x24/apps/ulaa-browser.png"
    install -Dm755 ./opt/zoho.com/ulaa/product_logo_32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/ulaa-browser.png"
    install -Dm755 ./opt/zoho.com/ulaa/product_logo_48.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/ulaa-browser.png" 
    install -Dm755 ./opt/zoho.com/ulaa/product_logo_64.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/ulaa-browser.png"
    install -Dm755 ./opt/zoho.com/ulaa/product_logo_128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/ulaa-browser.png"
    install -Dm755 ./opt/zoho.com/ulaa/product_logo_256.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/ulaa-browser.png"

    cp -ra ./opt ./usr ./etc "${pkgdir}"
}
