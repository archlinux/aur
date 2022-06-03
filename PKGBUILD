# Maintainer: Sarat Chandra <me at saratchandra dot in>

pkgname=doggo-bin
_pkgver=0.5.3
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
sha256sums_x86_64=('94576179ae9ec3e69f06f76219e5e952e7e3b59d3809ee19cf8a3f9e1b4acd14')
sha256sums_aarch64=('7fc6a311b7a030b44ef712cedb55d094eb0f2cc6bcf7c911b946c4064fcf6e45')

package() {
    cd "${srcdir}"

    # Install doggo
    install -D -m0755 doggo \
        "${pkgdir}/usr/bin/doggo"

    # Install doggo-api
    install -D -m0755 doggo-api.bin \
        "${pkgdir}/usr/bin/doggo-api"
}
