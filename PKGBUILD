# Maintainer: Jedrzej Nowak <pigmej@gmail.com>

pkgname=teleport-client
pkgver=4.4.1
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
    '77eb69c1ad4a536ecbb02a8c842f53576831ae8c95c1295091b0b5d90fb2643f'
    )
source_arm=(
    "https://get.gravitational.com/teleport-v${pkgver}-linux-arm-bin.tar.gz"
    )

sha256sums_arm=(
    '4d30261bdcff5c4aaacd424ce914e3085518b9eff6de8d12e77a4cb17788eefe'
    )

options=(!strip)

package() {
    mkdir -p "${pkgdir}/usr/bin"
    cd "${srcdir}/teleport"
    install -m755 -t "${pkgdir}/usr/bin/" tctl tsh
}