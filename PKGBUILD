# Maintainer: Dušan Mitrović <dusan@dusanmitrovic.xyz>
pkgname=wifiqr-bin
pkgver=1.2.2
pkgrel=1.2
pkgdesc="A simple program to generate a QR code to connect to a WiFi network (binary version)"
arch=('x86_64' 'aarch64')
url="https://github.com/dusnm/wifiqr"
_pkgurl="https://packages.t0.rs/${pkgname}"
license=('GPL3')
depends=()
optdepends=()
provides=('wifiqr')
conflicts=('wifiqr')
source_x86_64=(
    "${pkgname}-${pkgver}.tar.gz::${_pkgurl}/v${pkgver}_x86_64.tar.gz"
    "${pkgname}-${pkgver}.tar.gz.sig::${_pkgurl}/v${pkgver}_x86_64.tar.gz.sig"
)
source_aarch64=(
    "${pkgname}-${pkgver}.tar.gz::${_pkgurl}/v${pkgver}_aarch64.tar.gz"
    "${pkgname}-${pkgver}.tar.gz.sig::${_pkgurl}/v${pkgver}_aarch64.tar.gz.sig"
)
sha256sums_x86_64=(
    "c76633ac2b737db9277f02dce3497b89350786101dceea8acc43b7310dac69d1"
    "7d30f3aea8d1002ae3c7d805f2040105f37a82356fe35c22ef71713a91d805b9"
)
sha256sums_aarch64=(
    "d7e0d0c64299ec5b144a6242c6bdfc06ae8a65a053a19da0e48bd2a3ec37ee02"
    "97e3cfa3dd5b2542c0d7f7e177ab1579c200b64e198fc87cb9e6c9f1a1d7b874"
)
validpgpkeys=(
    # Get the key by running this command
    # gpg --recv-keys --keyserver=hkps://keys.openpgp.org BB713929B02F3CE81B84CD7554261991535AB4CB
    "BB713929B02F3CE81B84CD7554261991535AB4CB"
)

package() {
    install -Dm755 "${srcdir}/v${pkgver}_${CARCH}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
