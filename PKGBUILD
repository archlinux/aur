# Maintainer: Sarat Chandra <me at saratchandra dot in>

pkgname=doggo-bin
_pkgver=0.5.1
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
sha256sums_x86_64=('70f90d7f622b2195ffb9d86e329eda048c9eee7fd47d457b2a4c8fe94e5a7e47')
sha256sums_aarch64=('10c8b6676374274a5502723279f47354c272d11dbd86c6d857cb89243b0dd5d6')

package() {
    cd "${srcdir}"

    # Install doggo
    install -D -m0755 doggo \
        "${pkgdir}/usr/bin/doggo"

    # Install doggo-api
    install -D -m0755 doggo-api.bin \
        "${pkgdir}/usr/bin/doggo-api"
}
