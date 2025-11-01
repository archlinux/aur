# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=beautyline
pkgver=20251102
_commit=c7e1e76e73717e788152c276c9a853f1ed9ec807
pkgrel=1
epoch=1
pkgdesc="Outlined icons designed to have unified look and comprehensive coverage with the Candy icon pack (best suited to use with Sweet theme)"
arch=('any')
url="https://gitlab.com/garuda-linux/themes-and-settings/artwork/$pkgname"
license=('GPL')
makedepends=('git')
options=('!strip')
source=("git+${url}.git#commit=${_commit}")
sha256sums=('cc1102889a4f6732afb7a82871effe9aab2c304d3335162e7c092470ce918c8c')

package() {
    _move=(actions apps devices index.theme mimetypes places preferences status)

    install -d "${pkgdir}/usr/share/icons/BeautyLine"

    for i in "${_move[@]}"; do
      cp -r "${srcdir}/${pkgname}/${i}" "${pkgdir}/usr/share/icons/BeautyLine"
    done

    find "${pkgdir}/usr" -type f -exec chmod 644 {} \;
    find "${pkgdir}/usr" -type d -exec chmod 755 {} \;

    install -Dm644 "${srcdir}/${pkgname}/COPYING" "${pkgdir}/usr/share/licenses/beautyLine/LICENSE"
}
