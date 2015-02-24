# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>
# Please report issues at https://github.com/jojosch/pkgbuilds

pkgname=php-box
pkgver=2.5.1
pkgrel=1
pkgdesc="An application for building and managing Phars"
url="https://github.com/box-project/box2"
license="MIT"
arch=("any")
depends=("php>=5.3.3")
install="${pkgname}.install"
source=(
  "https://github.com/kherge-archive/Box/releases/download/${pkgver}/box-${pkgver}.phar"
  "https://raw.github.com/box-project/box2/${pkgver}/LICENSE"
)
sha256sums=(
  "58b0d0b8dcc900103e3e20119921d0d36ef612525f1f1c96ed79646d34d25a92"
  "ba2dfc30b9659262549c839894838d9a1fe78ca533d0338cebc2f4f634b3bb12"
)

package() {
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${srcdir}/box-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
