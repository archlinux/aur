# Maintainer: xpe-online <xpecnh2n@gmail.com>
# Maintainer: raindropqwq <raindropqwq@outlook.com>

pkgname=sjmcl-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="An open source Minecraft launcher designed by SJTU Minecraft Club"
arch=('x86_64')
url="https://github.com/UNIkeEN/SJMCL"
license=('GPL-3.0, custom:LICENSE.EXTRA')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
source=("https://github.com/UNIkeEN/SJMCL/releases/download/v${pkgver}/SJMCL_${pkgver}_linux_x86_64.deb"
  "https://raw.githubusercontent.com/UNIkeEN/SJMCL/v${pkgver}/LICENSE.EXTRA")
sha256sums=('d8efa28a754b7fbec1dadabb99811587b6353ac35acd012fde65e210bbb92e4f'
  'eb66a5cf3243a98ddd8f6cc76fb8835e651df7b8c0d48e59d9dda7ea4ed2386a')

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}"
  chmod +x ${pkgdir}/usr/bin/SJMCL
  install -Dm 644 "${srcdir}/LICENSE.EXTRA" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.EXTRA"
}
