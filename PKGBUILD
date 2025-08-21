# Maintainer: Mattanja D. Heck
# Maintainer: Ben Cooper

pkgname=ziti-edge-tunnel
pkgver=1.7.10
pkgrel=1
pkgdesc="The linux tunneller for your Ziti network."
arch=(x86_64 arm64 armhf arm)
depends=('polkit')
options=()
url="https://openziti.github.io/ziti/clients/linux.html"
license=('Apache-2.0')
install="ziti-edge-tunnel.install"

source=("ziti-edge-tunnel.service"
        "ziti-edge-tunnel-enroll.sh"
        "sysusers.conf"
        "tmpfiles.conf"
        "polkit.rules")
source_arm=("https://github.com/openziti/ziti-tunnel-sdk-c/releases/download/v${pkgver}/ziti-edge-tunnel-Linux_arm.zip")
source_armhf=("https://github.com/openziti/ziti-tunnel-sdk-c/releases/download/v${pkgver}/ziti-edge-tunnel-Linux_arm.zip")
source_arm64=("https://github.com/openziti/ziti-tunnel-sdk-c/releases/download/v${pkgver}/ziti-edge-tunnel-Linux_arm64.zip")
source_x86_64=("https://github.com/openziti/ziti-tunnel-sdk-c/releases/download/v${pkgver}/ziti-edge-tunnel-Linux_x86_64.zip")
sha256sums=('97881960e8763840782b936abbb94513ca929257738ad2bf96df45cc3a344628'
            '027be2beec25a3425ae8b2b79be294c5829c4715bd89b841e958a720c720aea7'
            '5efe7c102098705e0b1f4cfe7966a5b8c3cc88d0c0ee6427f5cc9c6126dc57a4'
            '10e482480cf6a12b41b8dbfd705af34f12b65fbec640affaeee963dc7449729f'
            '7d5d3f1995228e360917aa1adeca2432f19e995d4ba437ba8b5b22d8d0c15745')
sha256sums_x86_64=('135447237f255729076264d451b611f16fc6f039b1ce5f937039d04558bb0163')
sha256sums_arm64=('9b7cfe16a49aaa02251df55171b9d490e2fee2ece25871a746022fb6911cfefa')
sha256sums_armhf=('dc4a63927a61c9c92a965e10807a831961b636900d4499733d6cd59c215905e7')
sha256sums_arm=('dc4a63927a61c9c92a965e10807a831961b636900d4499733d6cd59c215905e7')

package() {
  install -D -m 0755 ziti-edge-tunnel ${pkgdir}/usr/bin/ziti-edge-tunnel
  install -D -m 0755 ziti-edge-tunnel-enroll.sh ${pkgdir}/usr/bin/ziti-edge-tunnel-enroll
  install -D -m 0644 ziti-edge-tunnel.service ${pkgdir}/usr/lib/systemd/system/ziti-edge-tunnel.service
  install -D -m 0644 sysusers.conf ${pkgdir}/usr/lib/sysusers.d/ziti-edge-tunnel.conf
  install -D -m 0644 tmpfiles.conf ${pkgdir}/usr/lib/tmpfiles.d/ziti-edge-tunnel.conf
  install -D -m 0644 polkit.rules ${pkgdir}/usr/share/polkit-1/rules.d/ziti-edge-tunnel.rules
}
