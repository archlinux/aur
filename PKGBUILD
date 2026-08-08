pkgname=hyprmoncfg
pkgver=1.9.1
pkgrel=1
pkgdesc="Terminal-first monitor configurator and auto-switching daemon for Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/crmne/hyprmoncfg"
license=('MIT')
install="${pkgname}.install"
depends=('hyprland')
optdepends=('systemd: user service for automatic profile switching')
conflicts=('hyprmoncfg-git')
options=('!debug' '!strip')
source_x86_64=("${url}/releases/download/v${pkgver}/hyprmoncfg_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/hyprmoncfg_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('711e77051194172f515d8f157303aebe1dced605141c342de2ea3b05e08fe383')
sha256sums_aarch64=('155869ca22f15cade518ed2c1e1e7b0ef7b7bedad51eb94b182256be78a1900b')

package() {
  install -Dm755 "${srcdir}/hyprmoncfg" "${pkgdir}/usr/bin/hyprmoncfg"
  install -Dm755 "${srcdir}/hyprmoncfgd" "${pkgdir}/usr/bin/hyprmoncfgd"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/packaging/applications/hyprmoncfg.desktop" "${pkgdir}/usr/share/applications/hyprmoncfg.desktop"
  install -Dm644 "${srcdir}/packaging/icons/hyprmoncfg.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/hyprmoncfg.svg"
  install -Dm644 "${srcdir}/packaging/systemd/hyprmoncfgd.service" "${pkgdir}/usr/lib/systemd/user/hyprmoncfgd.service"
}
