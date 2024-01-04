# Maintainer: chenx_dust <chenx_dust@outlook.com>
# Contributor: pallxk <aur@pallxk.com>
# Contributor: adiprasetya <ignilium.inc@gmail.com>

pkgname=clash-meta-bin
pkgver=1.18.0
pkgrel=1
pkgdesc="Provide a soft link for mihomo, keeping compatibility with the obsolete Clash.Meta."
arch=("i686" "x86_64" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/MetaCubeX/Clash.Meta"
license=("GPL3")
groups=()
depends=("glibc" "mihomo-bin")
makedepends=()
checkdepends=()
optdepends=()
provides=("clash-meta")
conflicts=("clash-meta")
replaces=()
backup=("etc/clash-meta/config.yaml")
options=()
install=${pkgname}.install
changelog=
source=("clash-meta.service"
        "clash-meta@.service"
        "config.yaml")

sha256sums=('9e8a28e22c159d7d70c258b65f47bc734543e54cb0cd3957ce19349aca145af8'
            '29c73ac66d6fe60bea4359ac1857e3452f26c2af792efd8dd16d558462472efb'
            'c4af03523b8006d206440163406ee9b4de1a10bb5023fb3194490b8225a5e481')

package() {
    cd "${srcdir}"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/usr/bin/mihomo" "${pkgdir}/usr/bin/clash-meta" 
    install -Dm644 "config.yaml" "${pkgdir}/etc/clash-meta/config.yaml"
    install -Dm644 "clash-meta.service" "${pkgdir}/usr/lib/systemd/system/clash-meta.service"
    install -Dm644 "clash-meta@.service" "${pkgdir}/usr/lib/systemd/system/clash-meta@.service"
}

