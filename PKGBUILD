# Maintainer: Orpheas van Rooij <orpheas.vanrooij at outlook dot com>

pkgname=wifi-qr
pkgver=0.2
pkgrel=3
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
source=("${pkgname}_${pkgver}-${pkgrel}_all.deb::https://github.com/kokoye2007/wifi-qr/releases/download/${pkgname}-${pkgver}-${pkgrel}/${pkgname}_${pkgver}-${pkgrel}_all.deb")
sha256sums=('a7fa130bc4a54d3d5679589ff89b3746c837b5f454ebf2e4b22d2335ba5860ac')

package() {
    cd "${pkgdir}"

    # extract Debian data file
    tar xf "${srcdir}/data.tar.xz"

    # unpack Debian changelog file 
    gzip -d "usr/share/doc/wifi-qr/changelog.Debian.gz"
    mv "usr/share/doc/wifi-qr/changelog.Debian" "usr/share/doc/wifi-qr/changelog"
}
