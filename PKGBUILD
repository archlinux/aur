pkgname=hyprmoncfg
pkgver=1.9.0
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
sha256sums_x86_64=('531f2558da3abbcea1ecbab314da413f932f697267566885adacd77f1bc96a52')
sha256sums_aarch64=('1c80c22238f1f6f3a8e6d2bc9c6598fdd14a95c13c60fa388e5c0c0de4528f75')

package() {
  install -Dm755 "${srcdir}/hyprmoncfg" "${pkgdir}/usr/bin/hyprmoncfg"
  install -Dm755 "${srcdir}/hyprmoncfgd" "${pkgdir}/usr/bin/hyprmoncfgd"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/packaging/applications/hyprmoncfg.desktop" "${pkgdir}/usr/share/applications/hyprmoncfg.desktop"
  install -Dm644 "${srcdir}/packaging/icons/hyprmoncfg.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/hyprmoncfg.svg"
  install -Dm644 "${srcdir}/packaging/systemd/hyprmoncfgd.service" "${pkgdir}/usr/lib/systemd/user/hyprmoncfgd.service"
}
