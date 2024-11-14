# Maintainer: Mattanja D. Heck
# Maintainer: Ben Cooper

pkgname=ziti-edge-tunnel
pkgver=1.2.6
pkgrel=1
pkgdesc="The linux tunneller for your Ziti network."
arch=('x86_64')
depends=('polkit')
options=()
url="https://openziti.github.io/ziti/clients/linux.html"
license=('Apache-2.0')
install="ziti-edge-tunnel.install"

source=("https://github.com/openziti/ziti-tunnel-sdk-c/releases/download/v${pkgver}/ziti-edge-tunnel-Linux_${arch}.zip"
        "ziti-edge-tunnel.service"
        "ziti-edge-tunnel-enroll.sh"
        "sysusers.conf"
        "tmpfiles.conf"
        "polkit.rules")
sha256sums=('a7a3a68a59ae25347aa8a590bbc0bbc42387cc14e790608ba424d3048f7b334b'
            '97881960e8763840782b936abbb94513ca929257738ad2bf96df45cc3a344628'
            '027be2beec25a3425ae8b2b79be294c5829c4715bd89b841e958a720c720aea7'
            '5efe7c102098705e0b1f4cfe7966a5b8c3cc88d0c0ee6427f5cc9c6126dc57a4'
            '2d9870a798d2b26dd8c11b1b031dec6dbf4d8ca9f05643e721a5d3134ab59d74'
            '7d5d3f1995228e360917aa1adeca2432f19e995d4ba437ba8b5b22d8d0c15745')

package() {
  install -D -m 0755 ziti-edge-tunnel ${pkgdir}/usr/bin/ziti-edge-tunnel
  install -D -m 0755 ziti-edge-tunnel-enroll.sh ${pkgdir}/usr/bin/ziti-edge-tunnel-enroll
  install -D -m 0644 ziti-edge-tunnel.service ${pkgdir}/usr/lib/systemd/system/ziti-edge-tunnel.service
  install -D -m 0644 sysusers.conf ${pkgdir}/usr/lib/sysusers.d/ziti-edge-tunnel.conf
  install -D -m 0644 tmpfiles.conf ${pkgdir}/usr/lib/tmpfiles.d/ziti-edge-tunnel.conf
  install -D -m 0644 polkit.rules ${pkgdir}/usr/share/polkit-1/rules.d/ziti-edge-tunnel.rules
}
