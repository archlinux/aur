# Maintainer: Orpheas van Rooij <orpheas.vanrooij at outlook dot com>

pkgname=wifi-qr
pkgver=0.4
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
source=("${pkgname}_${pkgver}-${pkgrel}_all.deb::https://github.com/kokoye2007/wifi-qr/releases/download/v${pkgver}/${pkgname}_${pkgver}-${pkgrel}_all.deb")
sha256sums=('d1e88dec06542a6e7e42c7bace5a95c9658a759f7461268844b27f85f660e042')

package() {
    cd "${pkgdir}"

    # extract Debian data file
    tar xf "${srcdir}/data.tar.zst"

    # unpack Debian changelog file 
    gzip -d "usr/share/doc/wifi-qr/changelog.Debian.gz"
    mv "usr/share/doc/wifi-qr/changelog.Debian" "usr/share/doc/wifi-qr/changelog"
}
