# Maintainer: a821 at mail dot de
# Contributor: Stefan Auditor <stefan@auditor.email>

pkgname=php-box-bin
_pkgname=${pkgname%-bin}
pkgver=4.7.0
pkgrel=1
pkgdesc="Fast, zero config application bundler with PHARs"
arch=("any")
url="https://github.com/box-project/box"
license=("MIT")
depends=("php" "php-sodium")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=(
  "${pkgname}-${pkgver}.phar::https://github.com/box-project/box/releases/download/${pkgver}/box.phar"
  "${pkgname}-${pkgver}.LICENSE::https://raw.github.com/box-project/box/${pkgver}/LICENSE"
)
sha256sums=('3d390eeaec33288098fe83f8a54c60cc575cb6be295f38ff4482b4b4f26f8d52'
            'ba2dfc30b9659262549c839894838d9a1fe78ca533d0338cebc2f4f634b3bb12')

package() {
  install -D -m644 "${pkgname}-${pkgver}.LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${pkgname}-${pkgver}.phar" "${pkgdir}/usr/bin/box"
}
