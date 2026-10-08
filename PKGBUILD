# Maintainer: Lucas Saavedra Vaz <lucasssvaz@users.noreply.github.com>
pkgname=traygolin-bin
_pkgname=traygolin
pkgver=0.1.0
pkgrel=1
pkgdesc="Unofficial Linux tray app for the Pangolin VPN client (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://github.com/lucasssvaz/traygolin"
license=('Apache-2.0' 'MIT')
depends=('glib2' 'glibc' 'gtk4' 'libadwaita>=1.9' 'polkit' 'hicolor-icon-theme')
optdepends=('pangolin-cli: official Pangolin VPN CLI (pangolin on PATH)')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!debug')
source_x86_64=("${_pkgname}-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.tar.gz")
# Set per release by .github/workflows/aur.yml; these placeholders fail verification.
sha256sums_x86_64=('ad23d667dcd189cc67836eecef676e3f747a2e395936e8f40a10ded0a7ccf95a')
sha256sums_aarch64=('c62df1ac8807e4fbb51ca1f2ebc8e767ea0868278fa88dbd7871d1b81e1200f2')

package() {
  cp -a "${srcdir}/usr" "${pkgdir}/"
  rm -f "${pkgdir}/usr/share/glib-2.0/schemas/gschemas.compiled"
  mv "${pkgdir}/usr/share/licenses/${_pkgname}" "${pkgdir}/usr/share/licenses/${pkgname}"
}
