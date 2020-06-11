# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="A Rust-VMM based cloud hypervisor from Intel (binary source)"
url="https://github.com/cloud-hypervisor/cloud-hypervisor"
arch=('x86_64')
license=('Apache:2.0')
depends=('virtiofsd')
provides=('cloud-hypervisor')
conflicts=('cloud-hypervisor')
source=(
  "https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/ch-remote"
  "https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/cloud-hypervisor"
  "https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/cloud-hypervisor-static"
)
sha512sums=(
  4ae31d9a13592546815e381534ea6ee5721cd400dc4112ffdacee97aac63ac04a86482a27935be51e14b2bd053c5e2a11583ad9d2f7a66b581675ad623ab1a82
  acec3cfecd1626d4f4a473022117a6080774abcc6838357dac7c60a85ce59c073e39ddab5c967221ea46c2f60f71307ea50d484eb4d7100ec8a6aaa429621f60
  f9013d6d1f28a824af4928ff592bb00faadb89a61803ab4063e6ad9ad8bb3e15de3ae7b1492b8c5cebc2bb4afda0ecb56ccd1d575868a29b1529fe18827cb495
)

package() {
  install -Dm755 -t ${pkgdir}/usr/bin ${srcdir}/{ch-remote,cloud-hypervisor{,-static}}
}
