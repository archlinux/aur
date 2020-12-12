# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="A Rust-VMM based cloud hypervisor from Intel (binary source)"
url="https://github.com/cloud-hypervisor/cloud-hypervisor"
arch=('x86_64')
license=('Apache:2.0')
optdepends=(
  'qemu-headless'  # for /usr/lib/qemu/virtiofsd
)
provides=('cloud-hypervisor')
conflicts=('cloud-hypervisor')
source=(
  "https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/ch-remote"
  "https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/cloud-hypervisor"
  "https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/cloud-hypervisor-static"
)
sha512sums=(
  8024ca839c9fc712a3e3451f4c4f72dae3b5962a8f413bdeb1bb157a049bdaf4f83908ad54125e2c5eeb954fa243efcd836089f58b4510c5958c794e270159ff
  d4112344bf496b2643d35aa71f8a56640f18d4406515a5d7b6548c068dc17eb6e0cf7d05baca42a00a0489fc95478536d05a2e2490d8596baee7a02fa9106e70
  08e98379cc74c2ca09a2a51efdc487dbdd824785b5cc82bdde5d71c698bad475622d90405a679922f4e95fa63547c0f36f46f3ec195b2c637561b92acad1acbd
)
b2sums=(
  6e585168f2661a5fab768943b04e327599f34597166e1a20901f08a1b3a7d569502b5db61b90d257ee4d7fecf594f0e56c4c089b63887d3e33343d5c18b26aba
  a20db8a8788fcf039d0c29bb56197a69ad02bcc2892b1b8820c0464d15126e49793606b6f22f53e69ec660a3c85493cf4625b5117c14d16ab0149ad68a315910
  2a99bcd9c78b74d37482e645486a5799937bed38de79f0b9b847b3ba020941d7b1f7bf333c591932bb8002af3cc394dbe5720588b7729143e9b0dedb8391808e
)

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" \
    "${srcdir}/ch-remote" \
    "${srcdir}/cloud-hypervisor" \
    "${srcdir}/cloud-hypervisor-static"
}
