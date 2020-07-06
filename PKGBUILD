# Maintainer: Jedrzej Nowak <pigmej@gmail.com>

pkgname=teleport-client
pkgver=4.2.11
pkgrel=2
pkgdesc="Modern SSH server for teams managing distributed infrastructure client only"
arch=('x86_64' 'arm')
url="https://gravitational.com/teleport"
license=('Apache')
depends=('glibc')
source_x86_64=(
    "https://get.gravitational.com/teleport-v${pkgver}-linux-amd64-bin.tar.gz"
    )
sha256sums_x86_64=(
    '06cceb16c9464317f8391be421e66ec7fdb3684123f20406cbc64be46909869a'
    )
source_arm=(
    "https://get.gravitational.com/teleport-v${pkgver}-linux-arm-bin.tar.gz"
    )

sha256sums_arm=(
    'dbae9e5f4bd57fadde03789f27609e56dac5c504b8a2474805291c184dd679ac'
    )

options=(!strip)

package() {
    mkdir -p "${pkgdir}/usr/bin"
    cd "${srcdir}/teleport"
    install -m755 -t "${pkgdir}/usr/bin/" tctl tsh
}