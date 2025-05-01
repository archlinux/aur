pkgname=bizstaff
pkgver=1.0.0
pkgrel=1
pkgdesc="Staff manager"
arch=('x86_64')
url="https://github.com/Muhiddin0/bizstaff-descktop/"
license=('MIT')
depends=('fuse2')
options=(!strip)

source=("${pkgname}-${pkgver}.AppImage::https://github.com/Muhiddin0/bizstaff-descktop/releases/download/v${pkgver}/Bizstaff-${pkgver}.AppImage"
        "bizstaff.desktop"
        "icon.png")
noextract=("${pkgname}-${pkgver}.AppImage")
sha256sums=('53468c4487dd6e4ad903ee7016c4c70ca9fa969c919644ffd922d6888dfc4cff'
            'd969a8fcbf5247d18f07cfa984e35ecf4e2d5b3edf73914677dba8cd5d23e060'
            '1788b26e8f3a387934aef323cccdaece25d9caa602774fee8d7745459eac8be5')

package() {
  # AppImage faylni /opt ichiga o‘rnatish
  install -d "${pkgdir}/opt/${pkgname}"
  cp -a "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/bizstaff.AppImage"
  chmod +x "${pkgdir}/opt/${pkgname}/bizstaff.AppImage"

  # .desktop faylni o‘rnatish
  install -Dm644 "${srcdir}/bizstaff.desktop" "${pkgdir}/usr/share/applications/bizstaff.desktop"

  # Iconni o‘rnatish
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
}