# Maintainer: zephyrdrh <zephyrdrh at gmx dot de>
# Contributor: markzz <mark dot weiman at markzz dot com>
# Contributor: ShadowKyogre <shadowkyogre@aim.com>

_gdrive_id=1KofbXUBUo_ue22BfiGR26wDU98eO6Y1c
pkgname=ttf-totem
pkgver=1.0
pkgrel=3
pkgdesc="Totem is a free font. Feel free to use it for personal and commercial."
arch=('any')
url="https://www.behance.net/gallery/16490287/TOTEM-Free-Typeface"
license=('LicenseRef-Freeware')
makedepends=('unrar')
depends=()
source=("ttf-totem-${pkgver}-${pkgrel}.rar::https://docs.google.com/uc?export=download&id=${_gdrive_id}")
noextract=("ttf-totem-${pkgver}-${pkgrel}.rar")
sha256sums=('d245930aea11f167414378709f16ec400b0b0e4337dade1317d84379ff4c6783')

prepare() {
  cd "${srcdir}"
  unrar e "${srcdir}/ttf-totem-${pkgver}-${pkgrel}.rar"
}

package() {
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -dm755 "$pkgdir/usr/share/licenses/${pkgname}"
  
  install -m644 "$srcdir/Totem.ttf" "$pkgdir/usr/share/fonts/TTF/Totem.ttf"
  install -m644 "$srcdir/License.txt" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
