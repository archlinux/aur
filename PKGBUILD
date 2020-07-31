# Maintainer: Jedrzej Nowak <pigmej@gmail.com>

pkgname=teleport-client
pkgver=4.3.2
pkgrel=1
pkgdesc="Modern SSH server for teams managing distributed infrastructure client only"
arch=('x86_64' 'arm')
url="https://gravitational.com/teleport"
license=('Apache')
depends=('glibc')
source_x86_64=(
    "https://get.gravitational.com/teleport-v${pkgver}-linux-amd64-bin.tar.gz"
    )
sha256sums_x86_64=(
    'daa7bfb239409c9231a22019ba39046d17bc75d021ce16d3333e0abadf158ddf'
    )
source_arm=(
    "https://get.gravitational.com/teleport-v${pkgver}-linux-arm-bin.tar.gz"
    )

sha256sums_arm=(
    'e43fe669974cb1882edae6b78a0f33e833aa5aaac0df95aa21ca0e7ef2dbfb56'
    )

options=(!strip)

package() {
    mkdir -p "${pkgdir}/usr/bin"
    cd "${srcdir}/teleport"
    install -m755 -t "${pkgdir}/usr/bin/" tctl tsh
}