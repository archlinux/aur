# Maintainer: xpe-online <xpecnh2n@gmail.com>

pkgname=sjmcl-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="An open source Minecraft launcher designed by SJTU Minecraft Club"
arch=('x86_64')
url="https://github.com/UNIkeEN/SJMCL"
license=('custom:GPL-3.0 WITH Extra terms')
makedepends=("binutils" "tar")
source=("https://github.com/UNIkeEN/SJMCL/releases/download/v${pkgver}/SJMCL_${pkgver}_linux_x86_64.deb"
  "https://raw.githubusercontent.com/UNIkeEN/SJMCL/v${pkgver}/LICENSE.EXTRA")
sha256sums=('92d3a387d4019804cc1c60c9113b667e579a54c0d3b49bd53f85e489d5ab4188'
  'eb66a5cf3243a98ddd8f6cc76fb8835e651df7b8c0d48e59d9dda7ea4ed2386a')

package() {
  tar -xf data.tar.gz -C "${pkgdir}"
  chmod +x ${pkgdir}/usr/bin/SJMCL
  install -Dm 644 "${srcdir}/LICENSE.EXTRA" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.EXTRA"
}
