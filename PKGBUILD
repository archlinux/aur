# Maintainer: Orpheas van Rooij <orpheas.vanrooij at outlook dot com>

pkgname=wifi-qr
pkgver=0.3
pkgrel=2
pkgdesc="WiFi Share and Connect with QR"
arch=('x86_64')
url="https://www.github.com/kokoye2007/wifi-qr"
license=('GPL3')
depends=(
    'zenity'
    'xdg-utils'
    'zbar'
    'qrencode'
    'networkmanager'
)
options=('!emptydirs' '!strip')
source=("${pkgname}_${pkgver}-${pkgrel}_all.deb::https://github.com/kokoye2007/wifi-qr/releases/download/v${pkgver}-${pkgrel}/${pkgname}_${pkgver}-${pkgrel}_all.deb")
sha256sums=('039d89be4493ef6da8ae7b9032d428f926156220a1a2d2e69d1a1fa04faf5199')

package() {
    cd "${pkgdir}"

    # extract Debian data file
    tar xf "${srcdir}/data.tar.zst"

    # unpack Debian changelog file 
    gzip -d "usr/share/doc/wifi-qr/changelog.Debian.gz"
    mv "usr/share/doc/wifi-qr/changelog.Debian" "usr/share/doc/wifi-qr/changelog"
}
