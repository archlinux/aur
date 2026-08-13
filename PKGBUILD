pkgname=hyprmoncfg
pkgver=1.11.0
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
sha256sums_x86_64=('3ed33b211f62849b909f92f3b59aced88532abc8986c71c68678163f69ef5d39')
sha256sums_aarch64=('d8bf777bbf2fe8217d875e360a738aa3b4823da5cb8c9d4b460340b16d0d9205')

package() {
  install -Dm755 "${srcdir}/hyprmoncfg" "${pkgdir}/usr/bin/hyprmoncfg"
  install -Dm755 "${srcdir}/hyprmoncfgd" "${pkgdir}/usr/bin/hyprmoncfgd"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/packaging/applications/hyprmoncfg.desktop" "${pkgdir}/usr/share/applications/hyprmoncfg.desktop"
  install -Dm644 "${srcdir}/packaging/icons/hyprmoncfg.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/hyprmoncfg.svg"
  install -Dm644 "${srcdir}/packaging/systemd/hyprmoncfgd.service" "${pkgdir}/usr/lib/systemd/user/hyprmoncfgd.service"
}
