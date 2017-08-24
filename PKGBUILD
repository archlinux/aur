# Maintainer: Chris Snell <chris.snell@gmail.com>

pkgname=ttf-interface
pkgver=1.1
pkgrel=1
pkgdesc="A font for highly legible text on computer screens"
url="https://rsms.me/interface/"
arch=(any)
license=(custom:"SIL Open Font License")
# https://github.com/rsms/interface/releases/download/v1.1/Interface-1.1.zip
source=("interface-${pkgver}.zip::https://github.com/rsms/interface/releases/download/v${pkgver}/Interface-${pkgver}.zip" "OFL.txt::http://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=OFL_plaintext&filename=OFL.txt")
sha256sums=('f8a82c1a7e77d5c1892a8a835401729cb79390c40427115adda3058323fb6433' 'ca122f3bda0154f692817450168cb650a7fc59ef96c93582acd2e7a744d464d3')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 "Interface (OTF)/*.otf"
  install -d "$pkgdir/usr/share/licenses/${pkgname}"
  install -t "${pkgdir}/usr/share/licenses/${pkgname}" -m644 OFL.txt
}

# vim:set ts=2 sw=2 et:
