# Maintainer: Lucas Saavedra Vaz <lucasssvaz@users.noreply.github.com>
pkgname=traygolin-bin
_pkgname=traygolin
pkgver=0.2.0
pkgrel=1
pkgdesc="Unofficial Linux tray app for the Pangolin VPN client (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://github.com/lucasssvaz/traygolin"
license=('Apache-2.0' 'MIT')
depends=('glib2' 'glibc' 'gtk4' 'libadwaita>=1.9' 'gobject-introspection' 'polkit' 'hicolor-icon-theme')
optdepends=('pangolin-cli: official Pangolin VPN CLI (pangolin on PATH)')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!debug')
source_x86_64=("${_pkgname}-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.tar.gz")
# Set per release by .github/workflows/aur.yml; these placeholders fail verification.
sha256sums_x86_64=('9b81b404a844a7bd989029099ea73d8e485b39ec4fd2c29004e0c3138b6dfb76')
sha256sums_aarch64=('7da4b90b6983522ca39e22896494248f9741abf834dff1a8d0a5d864730a6209')

package() {
  cp -a "${srcdir}/usr" "${pkgdir}/"
  rm -f "${pkgdir}/usr/share/glib-2.0/schemas/gschemas.compiled"
  mv "${pkgdir}/usr/share/licenses/${_pkgname}" "${pkgdir}/usr/share/licenses/${pkgname}"
}
