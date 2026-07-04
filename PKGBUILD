# Maintainer: Twilight <twilight@aliveos.org>
# Sources from the standalone aliveos-assets GitHub repo (tag 1.0.0).

pkgname=aliveos-assets
pkgver=1.1.1
pkgrel=1
pkgdesc="Distro identity assets for AliveOS: neon dark square icon theme, wallpapers, and system logo"
arch=('any')
url="https://github.com/Twilight0/aliveos-assets"
license=('GPL3')
depends=('hicolor-icon-theme')
optdepends=('papirus-icon-theme: fallback icon theme')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # --- Icon theme ---
  install -d "${pkgdir}/usr/share/icons/aliveos"
  cp -a "icons/aliveos/." "${pkgdir}/usr/share/icons/aliveos/"

  # --- System logo (pixmaps) ---
  install -Dm644 "pixmaps/aliveos-logo.png" "${pkgdir}/usr/share/pixmaps/aliveos-logo.png"

  # --- Wallpapers ---
  install -d "${pkgdir}/usr/share/backgrounds/aliveos"
  cp -a "backgrounds/aliveos/." "${pkgdir}/usr/share/backgrounds/aliveos/"
}