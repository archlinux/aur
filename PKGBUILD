# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=beautyline
pkgver="3.0.2"
_commit='1b123f5004f9c77a77d778f02064ecd9b415aa3e'
pkgrel=1
epoch=1
pkgdesc="Outlined icons designed to have unified look and comprehensive coverage with the Candy icon pack (best suited to use with Sweet theme)"
arch=('any')
url="https://gitlab.com/garuda-linux/themes-and-settings/artwork/$pkgname"
license=('GPL')
options=('!strip')
source=("https://gitlab.com/garuda-linux/themes-and-settings/artwork/beautyline/-/archive/${_commit}/beautyline-${_commit}.tar.gz")
sha256sums=('SKIP')

package() {
  _move=(actions apps devices index.theme mimetypes places preferences status)

  install -d "${pkgdir}/usr/share/icons/BeautyLine"

  for i in "${_move[@]}"; do
    cp -r "${srcdir}/${pkgname}-${_commit}/${i}" "${pkgdir}/usr/share/icons/BeautyLine"
  done

  find "${pkgdir}/usr" -type f -exec chmod 644 {} \;
  find "${pkgdir}/usr" -type d -exec chmod 755 {} \;

  install -Dm644 "${srcdir}/${pkgname}-${_commit}/COPYING" "${pkgdir}/usr/share/licenses/beautyLine/LICENSE"
}
