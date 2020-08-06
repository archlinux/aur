# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor-bin
pkgver=0.9.0
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
  0f03834d6908159a37e612a77b306a3ac72f63d204e8439c77739f39ee90566534109002e4e3621fc88b93e1c5f780b57014269baef8db20c319074595662c60
  e1cb645316fe8c3809ab88daa6961df9a8b248f68138ca3100ef8e0ddde30d823884c0e69b92acfb8490b114a19713d62f3d8b28c5bc10496e7dd4acdabe1b9c
  0d6ef97d2078e251e1e1e09ef9fb81aaa183184b0c4302b94cf88055a06ff68f1176caa9cbed94c451db475cb7d9f77a205831b6408f36861c45f8aa24d94aaf
)

package() {
  install -Dm755 -t ${pkgdir}/usr/bin ${srcdir}/{ch-remote,cloud-hypervisor{,-static}}
}
