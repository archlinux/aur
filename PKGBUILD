# Maintainer: nabbisen <nabbisen@scqr.net>
pkgname=forskscope
pkgver=0.22.8
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
sha256sums=('4e2ae6c78d8f85399d282ff63496e4f7cbfc73092ccbca43025e94bac70b4aee')

package() {
  # app
  tar -xf "${srcdir}/${pkgname}@Linux-x64-gnu-${pkgver}.tar.gz" -C "${srcdir}"
  install -Dm755 "${srcdir}/${pkgname}@Linux-x64-gnu-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # .desktop
  install -Dm644 "${srcdir}/.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  # icon
  install -Dm644 "${srcdir}/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}
