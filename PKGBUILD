# Maintainer: Bouteiller a2n Alan <a2n.dev@pm.me>
pkgname=tape-bin
appname=tape
pkgver=4.0.3
pkgrel=3
pkgdesc="Take notes without bloat"
arch=('x86_64')
url="https://github.com/results-may-vary-org/tape"
license=('GPL')
depends=('glibc' 'gtk3' 'webkit2gtk-4.1' 'desktop-file-utils' 'hicolor-icon-theme')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v"${pkgver}"/"${appname}"-gtk4_"${pkgver}"_amd64.deb")
sha256sums_x86_64=('1331091f9153947d91e8848a3a6e19a8c13ddc6823b896d160d8691f32475862')
package() {
  # Extract the deb package
  ar x "${appname}-gtk4_${pkgver}_amd64.deb"

  # Extract package data (nfpm may use gz, xz, or zst compression)
  tar -xf data.tar.* -C "${pkgdir}"

  # Fix permissions
  chmod 755 "${pkgdir}/usr/bin/tape"
}
