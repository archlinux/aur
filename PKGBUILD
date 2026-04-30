# Maintainer: nabbisen
pkgname=forskscope
pkgver=0.22.13
pkgrel=1
pkgdesc="Diff and merge GUI tool with cross-platform support build with Tauri: Rust and Svelte (Pre-built binary)"
arch=('x86_64')
url="https://github.com/forskscope/forskscope"
license=('BSD-2-Clause')
depends=('webkit2gtk' 'gtk3' 'libappindicator-gtk3')
source=(
  "${pkgname}@Linux-x64-gnu-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${pkgname}@Linux-x64-gnu-${pkgver}.tar.gz"
  ".desktop"
  "logo.svg"
)
sha256sums=('e85bdeeeea887145dd376c643488d2e58733860692c67f34df59acc6bc6e9599' 'd9b2cb88d794bdd0db4638cb885250b3911518955517d62a5661861f5f1b4457' 'd50b81f03aeaf03bdcf503d2e973d013ea70e199fe8c28c50795b1e3daa65819')

package() {
  # app
  tar -xf "${srcdir}/${pkgname}@Linux-x64-gnu-${pkgver}.tar.gz" -C "${srcdir}"
  install -Dm755 "${srcdir}/${pkgname}@Linux-x64-gnu-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # .desktop
  install -Dm644 "${srcdir}/.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  # icon
  install -Dm644 "${srcdir}/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}
