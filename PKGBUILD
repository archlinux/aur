# Maintainer: nabbisen <nabbisen@scqr.net>
pkgname=forskscope
pkgver=0.22.11
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
sha256sums=('b91c25452a7e7701b3292fdb9d5061080f5d65d9e19db259b3edf504c064a3fb' '1db02aa56452951d27d5d19b7e2f15564b092ed48bb5cc8d1d4f429f1d1390d0' 'd50b81f03aeaf03bdcf503d2e973d013ea70e199fe8c28c50795b1e3daa65819')

package() {
  # app
  tar -xf "${srcdir}/${pkgname}@Linux-x64-gnu-${pkgver}.tar.gz" -C "${srcdir}"
  install -Dm755 "${srcdir}/${pkgname}@Linux-x64-gnu-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # .desktop
  install -Dm644 "${srcdir}/.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  # icon
  install -Dm644 "${srcdir}/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}
