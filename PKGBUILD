# Maintainer: Bart Libert <aur@bart.libert.email>
pkgname=barracudavpn-bin
pkgver=5.2.2
pkgrel=1
pkgdesc="Barracuda VPN Client for Linux - needs original download from Barracuda"
arch=("i386" "x86_64")
conflicts=('barracudavpn')
provides=('barracudavpn')

url="https://campus.barracuda.com/product/networkaccessclient"
license=("custom:FortiClientSSLVPN")

_srctarball="VPNClient_${pkgver}_Linux.tar.gz"

source=("${_srctarball}::local://${_srctarball}")
sha256sums=('91459886ec634eca30321dc975de3208591084b2103801365442ef9c4e38e4ae')

options=(debug !strip)

prepare() {
    cd "${srcdir}"
    ar x barracudavpn_${pkgver}_amd64.deb data.tar.xz
    tar -xf data.tar.xz
}

package() {
    echo "${pkgdir}"
    install -Dm 4755 ${srcdir}/usr/local/bin/barracudavpn ${pkgdir}/usr/bin/barracudavpn
}
