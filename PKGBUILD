# Maintainer: Sarat Chandra <me at saratchandra dot in>

pkgname=doggo-bin
_pkgver=0.5.4
pkgver=v${_pkgver}
pkgrel=1
pkgdesc="Command-line DNS client for humans "
arch=('x86_64' 'aarch64')
url="https://github.com/mr-karan/doggo"
license=('MIT')
depends=()
makedepends=()
provides=('doggo')
conflicts=('doggo')
source_x86_64=("https://github.com/mr-karan/doggo/releases/download/${pkgver}/doggo_${_pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/mr-karan/doggo/releases/download/${pkgver}/doggo_${_pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('b85768a4f994ad3b4af0ec905e4a26b0a0d774c20f99cb36115fcb5d9c9dd61f')
sha256sums_aarch64=('5500233dc76fb8adbb1c532052f35796e29cf5e1c4c1b4a1d46e53e850b1369e')

package() {
    cd "${srcdir}"

    # Install doggo
    install -D -m0755 doggo \
        "${pkgdir}/usr/bin/doggo"

    # Install doggo-api
    install -D -m0755 doggo-api.bin \
        "${pkgdir}/usr/bin/doggo-api"
}
