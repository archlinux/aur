# Maintainer: Mattanja D. Heck
# Maintainer: Ben Cooper

pkgname=ziti-edge-tunnel
pkgver=1.2.6
pkgrel=1
pkgdesc="The linux tunneller for your Ziti network."
arch=(x86_64 aarch64 arm64 armhf arm)
depends=('polkit')
options=()
url="https://openziti.github.io/ziti/clients/linux.html"
license=('Apache-2.0')
install="ziti-edge-tunnel.install"

source=("ziti-edge-tunnel-Linux_source_${pkgver}.tar.gz::https://github.com/openziti/ziti-tunnel-sdk-c/archive/refs/tags/v${pkgver}.tar.gz"
        "ziti-edge-tunnel.service"
        "ziti-edge-tunnel-enroll.sh"
        "sysusers.conf"
        "tmpfiles.conf"
        "polkit.rules")
source_arm=("https://github.com/openziti/ziti-tunnel-sdk-c/releases/download/v${pkgver}/ziti-edge-tunnel-Linux_arm.zip")
source_armhf=("https://github.com/openziti/ziti-tunnel-sdk-c/releases/download/v${pkgver}/ziti-edge-tunnel-Linux_arm.zip")
source_arm64=("https://github.com/openziti/ziti-tunnel-sdk-c/releases/download/v${pkgver}/ziti-edge-tunnel-Linux_arm64.zip")
source_aarch64=("https://github.com/openziti/ziti-tunnel-sdk-c/releases/download/v${pkgver}/ziti-edge-tunnel-Linux_aarch64.zip")
source_x86_64=("https://github.com/openziti/ziti-tunnel-sdk-c/releases/download/v${pkgver}/ziti-edge-tunnel-Linux_x86_64.zip")
sha256sums=('1cc6dd18d57ea8df2b359b6d0716e2549e553b176b7aeda54468bee06503ef60'
            '97881960e8763840782b936abbb94513ca929257738ad2bf96df45cc3a344628'
            '027be2beec25a3425ae8b2b79be294c5829c4715bd89b841e958a720c720aea7'
            '5efe7c102098705e0b1f4cfe7966a5b8c3cc88d0c0ee6427f5cc9c6126dc57a4'
            '2d9870a798d2b26dd8c11b1b031dec6dbf4d8ca9f05643e721a5d3134ab59d74'
            '7d5d3f1995228e360917aa1adeca2432f19e995d4ba437ba8b5b22d8d0c15745')
sha256sums_x86_64=('a7a3a68a59ae25347aa8a590bbc0bbc42387cc14e790608ba424d3048f7b334b')
sha256sums_aarch64=('0f2aaa81f4683c3bea072b55c5d732d440ee74b747d67d93ddaee988256d63ef')
sha256sums_arm64=('0f2aaa81f4683c3bea072b55c5d732d440ee74b747d67d93ddaee988256d63ef')
sha256sums_armhf=('46b28d9dc0aecf27f4197c45403f49d7279caba907052785a77f984ce3d06ae1')
sha256sums_arm=('46b28d9dc0aecf27f4197c45403f49d7279caba907052785a77f984ce3d06ae1')

package() {
  install -D -m 0755 ziti-edge-tunnel ${pkgdir}/usr/bin/ziti-edge-tunnel
  install -D -m 0755 ziti-edge-tunnel-enroll.sh ${pkgdir}/usr/bin/ziti-edge-tunnel-enroll
  install -D -m 0644 ziti-edge-tunnel.service ${pkgdir}/usr/lib/systemd/system/ziti-edge-tunnel.service
  install -D -m 0644 sysusers.conf ${pkgdir}/usr/lib/sysusers.d/ziti-edge-tunnel.conf
  install -D -m 0644 tmpfiles.conf ${pkgdir}/usr/lib/tmpfiles.d/ziti-edge-tunnel.conf
  install -D -m 0644 polkit.rules ${pkgdir}/usr/share/polkit-1/rules.d/ziti-edge-tunnel.rules
}
