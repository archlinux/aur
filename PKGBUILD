# Maintainer: Jedrzej Nowak <pigmej@gmail.com>

pkgname=teleport-client
pkgver=5.1.0
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
    '9b27eb994c94897fac776e7b8cee54038dc6b33f8126603a459e2d47eaa55dfb'
    )
source_arm=(
    "https://get.gravitational.com/teleport-v${pkgver}-linux-arm-bin.tar.gz"
    )

sha256sums_arm=(
    'e9053afd6ea0f4a57e99501f464235859d7701046f941c92e238e6ef9e4ef8ae'
    )

options=(!strip)

package() {
    mkdir -p "${pkgdir}/usr/bin"
    cd "${srcdir}/teleport"
    install -m755 -t "${pkgdir}/usr/bin/" tctl tsh
}