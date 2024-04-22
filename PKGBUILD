# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=beautyline
pkgver=20240421
_commit=2c1dac627be2bfc3f8047df5697fba466564275f
pkgrel=2
epoch=1
pkgdesc="Outlined icons designed to have unified look and comprehensive coverage with the Candy icon pack (best suited to use with Sweet theme)"
arch=('any')
url="https://gitlab.com/garuda-linux/themes-and-settings/artwork/$pkgname"
license=('GPL')
makedepends=('git')
options=('!strip')
source=("git+${url}.git#commit=${_commit}")
sha256sums=('38e869e4e9f69c75de9845c7bcac81c8570f7f2b57899b08ae4298169ca67686')

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
