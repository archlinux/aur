# Maintainer: Sarat Chandra <me at saratchandra dot in>

pkgname=doggo-bin
_pkgver=0.5.2
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
sha256sums_x86_64=('2af897755ee603cb14326940d8f991ecf52c93e9ecedd95749024a8f2bbbd444')
sha256sums_aarch64=('7c9b56152e75da41621483e2d9b55a3049affeb907a9417e1ab784c363a5a57f')

package() {
    cd "${srcdir}"

    # Install doggo
    install -D -m0755 doggo \
        "${pkgdir}/usr/bin/doggo"

    # Install doggo-api
    install -D -m0755 doggo-api.bin \
        "${pkgdir}/usr/bin/doggo-api"
}
