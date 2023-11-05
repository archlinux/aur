# Maintainer: Orpheas van Rooij <orpheas.vanrooij at outlook dot com>

pkgname=wifi-qr
pkgver=0.3
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
sha256sums=('6c90d50d93be054533ed5caf6eeac587e7fa451a2ed91dfeccb3d4c1d381160c')

package() {
    cd "${pkgdir}"

    # extract Debian data file
    tar xf "${srcdir}/data.tar.xz"

    # unpack Debian changelog file 
    gzip -d "usr/share/doc/wifi-qr/changelog.Debian.gz"
    mv "usr/share/doc/wifi-qr/changelog.Debian" "usr/share/doc/wifi-qr/changelog"
}
