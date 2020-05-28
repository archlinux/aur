# Maintainer: Jedrej Nowak <pigmej@gmail.com>

pkgname=teleport-client
pkgver=4.2.10
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
    'd31ec5a5d31aefa772d53b70ee25cd5fce40554ad61c1d1af69ee38ac421e9b6'
    )
source_arm=(
    "https://get.gravitational.com/teleport-v${pkgver}-linux-arm-bin.tar.gz"
    )

sha256sums_arm=(
    'ab5a234d923677885fa6bc6fe52bcd4d7feb195408842e3183d39c6f49b4e1bc'
    )

options=(!strip)

package() {
    mkdir -p "${pkgdir}/usr/bin"
    cd "${srcdir}/teleport"
    install -m755 -t "${pkgdir}/usr/bin/" tctl tsh
}
