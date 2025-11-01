# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=beautyline
pkgver=20251101
_commit=9def5490c528453eeeb41eafe3abeae425e92f02
pkgrel=1
epoch=1
pkgdesc="Outlined icons designed to have unified look and comprehensive coverage with the Candy icon pack (best suited to use with Sweet theme)"
arch=('any')
url="https://gitlab.com/garuda-linux/themes-and-settings/artwork/$pkgname"
license=('GPL')
makedepends=('git')
options=('!strip')
source=("git+${url}.git#commit=${_commit}")
sha256sums=('a8c1f193a4e7b1c14b1abc202a760adae8160afe0033b2731fab67589c6fc542')

package() {
    _move=(actions apps devices index.theme mimetypes places preferences)

    install -d "${pkgdir}/usr/share/icons/BeautyLine"

    for i in "${_move[@]}"; do
      cp -r "${srcdir}/${pkgname}/${i}" "${pkgdir}/usr/share/icons/BeautyLine"
    done

    find "${pkgdir}/usr" -type f -exec chmod 644 {} \;
    find "${pkgdir}/usr" -type d -exec chmod 755 {} \;

    install -Dm644 "${srcdir}/${pkgname}/COPYING" "${pkgdir}/usr/share/licenses/beautyLine/LICENSE"
}
