# Maintainer: Stefan Auditor <stefan@auditor.email>
# Please report issues at https://github.com/sanduhrs/arch-aur-php-box-bin

_pkgname=php-box
pkgname=${_pkgname}-bin
pkgver=4.4.0
pkgrel=1
pkgdesc="Fast, zero config application bundler with PHARs"
arch=("any")
url="https://github.com/box-project/box"
license=("MIT")
depends=("php" "php-sodium")
provides=(${_pkgname})
conflicts=(${_pkgname})
install="${_pkgname}.install"
source=(
  "${_pkgname}-${pkgver}.phar::https://github.com/box-project/box/releases/download/${pkgver}/box.phar"
  "LICENSE-${pkgver}::https://raw.github.com/box-project/box/${pkgver}/LICENSE"
)
sha256sums=('5009ae580c4fc92f6a7d22e08d76798610d91f1afc2d0f1b391531cf28e93525'
            'ba2dfc30b9659262549c839894838d9a1fe78ca533d0338cebc2f4f634b3bb12')

package() {
  install -D -m644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m755 "${srcdir}/${_pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${_pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${_pkgname}.phar" "${pkgdir}/usr/bin/box"
}
