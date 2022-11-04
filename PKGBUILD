# Maintainer: Orpheas van Rooij <orpheas.vanrooij at outlook dot com>

pkgname=wifi-qr
pkgver=0.2
pkgrel=1
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
source=("${pkgname}_${pkgver}-${pkgrel}_all.deb::https://github.com/kokoye2007/wifi-qr/releases/download/${pkgver}/${pkgname}_${pkgver}-${pkgrel}_all.deb")
sha256sums=('cc38985fe9cd4c44a550a2a6bc314bfc79b6b8d76e27b8da8e5de7beb403b08c')

package() {
    cd "${pkgdir}"

    # extract Debian data file
    tar xf "${srcdir}/data.tar.xz"

    # unpack Debian changelog file 
    gzip -d "usr/share/doc/wifi-qr/changelog.Debian.gz"
    mv "usr/share/doc/wifi-qr/changelog.Debian" "usr/share/doc/wifi-qr/changelog"
}
