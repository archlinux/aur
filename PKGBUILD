# Maintainer: r3g1s <21206554+reg1z (at) user (dot) noreply (dot) github (dot) com>
pkgname=omarchy-kali-vm
pkgver=0.1.2
pkgrel=2
pkgdesc="Standalone Kali Linux VM launcher with optional Omarchy integration"
arch=('x86_64')
url="https://github.com/r3b1s/omarchy-kali-vm"
license=('MIT')
depends=(
  'bash'
  'coreutils'
  'curl'
  'docker'
  'e2fsprogs'
  'gnupg'
  'gum'
  'libnotify'
  'sudo'
  'virt-viewer'
)
makedepends=('git')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bd51e69f24c49d5be46c5c85c77ae23f3a898eb2d47129bc74e6988d024db3de')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "bin/omarchy-kali-vm" "${pkgdir}/usr/bin/omarchy-kali-vm"
  install -Dm755 "bin/omarchy-kali-vm-integrate-os" "${pkgdir}/usr/bin/omarchy-kali-vm-integrate-os"
  install -Dm755 "bin/omarchy-kali-vm-unintegrate-os" "${pkgdir}/usr/bin/omarchy-kali-vm-unintegrate-os"

  install -Dm644 "assets/icons/kali.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/omarchy-kali-vm.png"

  install -Dm644 "share/hypr/omarchy-kali-vm.conf" "${pkgdir}/usr/share/omarchy-kali-vm/hypr/omarchy-kali-vm.conf"
  install -Dm644 "share/omarchy-menu.sh" "${pkgdir}/usr/share/omarchy-kali-vm/omarchy-menu.sh"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "docs/cleanup.md" "${pkgdir}/usr/share/doc/${pkgname}/cleanup.md"
  install -Dm644 "docs/integration.md" "${pkgdir}/usr/share/doc/${pkgname}/integration.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
