# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=beautyline
pkgver=20250720
_commit=0df6f5df71c19496f9a873f8a52fbb5e84e95b12
pkgrel=1
epoch=1
pkgdesc="Outlined icons designed to have unified look and comprehensive coverage with the Candy icon pack (best suited to use with Sweet theme)"
arch=('any')
url="https://gitlab.com/garuda-linux/themes-and-settings/artwork/$pkgname"
license=('GPL')
makedepends=('git')
options=('!strip')
source=("git+${url}.git#commit=${_commit}")
sha256sums=('e7cef593f9797eec91cb8cce99e90f11f0e08755a264300874570e39c823db7e')

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
