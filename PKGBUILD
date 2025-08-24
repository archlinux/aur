# Maintainer: nabbisen <nabbisen@scqr.net>
pkgname=forskscope
pkgver=0.22.9
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
sha256sums=('1a296d4603291d26a36be27e69051cffb66d39998ba41901023e9073a9107b5f' 'bca88fa304c3a655a4354b8905c4c29e556efa72c4d3fcf6c7c4d3fe65385328' 'd50b81f03aeaf03bdcf503d2e973d013ea70e199fe8c28c50795b1e3daa65819')

package() {
  # app
  tar -xf "${srcdir}/${pkgname}@Linux-x64-gnu-${pkgver}.tar.gz" -C "${srcdir}"
  install -Dm755 "${srcdir}/${pkgname}@Linux-x64-gnu-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # .desktop
  install -Dm644 "${srcdir}/.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  # icon
  install -Dm644 "${srcdir}/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}
