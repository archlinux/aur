# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="A Rust-VMM based cloud hypervisor from Intel (binary source)"
url="https://github.com/cloud-hypervisor/cloud-hypervisor"
arch=('x86_64')
license=('Apache:2.0')
depends=('virtiofsd')
makedepends=('rust')
provides=('cloud-hypervisor')
conflicts=('cloud-hypervisor')
source=(
  "https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/ch-remote"
  "https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/cloud-hypervisor"
  "https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/cloud-hypervisor-static"
)
sha512sums=(
  d90d2a978d67152ec2ffa56d9523d79edec7376decce7bd40bcf40930613320dafc989d5519112ed2ee6f4ebe37685caa81a0123f9016cca9add032009600604
  9e9ff187d8da2c1d54bad7d9cb6942eceeea447b79c1c6f137fb344c22eeb65189bdc1cc4bc8e4e43e4899a0412e4e42c7572c4c78c8d5f0fa6c8630af288e0a
  03a1ffa5468de49af568cb734b3812a53f43f93a389faf4a440720fd3ccf6d791a55c5c2f77dd47f03d3d0413af93e7d1e4be0f0f6c7a5dd0bff26dd97387fde
)

package() {
  install -Dm755 -t ${pkgdir}/usr/bin ${srcdir}/{ch-remote,cloud-hypervisor{,-static}}
}
