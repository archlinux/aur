# Maintainer: Sarat Chandra <me at saratchandra dot in>

pkgname=doggo-bin
_pkgver=0.5.5
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
sha256sums_x86_64=('30accb056bfada350265eb8e32223c06b5540d609eaa0c61cd4cc5fcfcb7a5fb')
sha256sums_aarch64=('da30a797ae0495cec584fae373bcd7c1c944741e6a4ae97705f5cf0415125c05')

package() {
    cd "${srcdir}"

    # Install doggo
    install -D -m0755 doggo \
        "${pkgdir}/usr/bin/doggo"

    # Install doggo-api
    install -D -m0755 doggo-api.bin \
        "${pkgdir}/usr/bin/doggo-api"
}
