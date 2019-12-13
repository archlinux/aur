# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>
# Please report issues at https://github.com/jojosch/pkgbuilds

_pkgname=php-box
pkgname=${_pkgname}
pkgver=2.7.5
pkgrel=1
pkgdesc="An application for building and managing Phars"
url="https://github.com/box-project/box2"
license=("MIT")
arch=("any")
depends=("php>=5.3.3")
install="${_pkgname}.install"
source=(
  "https://github.com/box-project/box2/releases/download/${pkgver}/box-${pkgver}.phar"
  "https://github.com/box-project/box2/releases/download/${pkgver}/box-${pkgver}.phar.sig"
  "https://raw.github.com/box-project/box2/${pkgver}/LICENSE"
)
sha256sums=('28b4b798ad4dcf8fbf9cd68aaff495d4bbeaec4363f5f319a222829d9b6abdfe'
            'SKIP'
            'ba2dfc30b9659262549c839894838d9a1fe78ca533d0338cebc2f4f634b3bb12')
validpgpkeys=("32E4B74757B1D65234FC389F293D771241515FE8")

package() {
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m755 "${srcdir}/box-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${_pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${_pkgname}.phar" "${pkgdir}/usr/bin/${_pkgname}"
}
