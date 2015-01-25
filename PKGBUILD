# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds

pkgname="phpmd"
pkgver=2.2.0
pkgrel=1
pkgdesc="Takes a given PHP source code base and look for several potential problems within that source."
url="http://phpmd.org/"
license="BSD"
arch=("any")
depends=("php>=5.3.0")
source=(
  "${pkgname}-${pkgver}.phar::http://static.phpmd.org/php/${pkgver}/${pkgname}.phar"
  "LICENSE"
)
install="${pkgname}.install"
sha1sums=(
  "c907b721f719d339c0b325aca228e0e0b3f4987e"
  "49a94fd699270de8599423fd3302cb6880f9c224"
)
sha256sums=(
  "d4140f6f65c5e6683575475e7b3d78b8717e7ae248542c371681bc0e23ac9650"
  "faad499ee7fe2e75e18565c6b6b5cf43a3dc97a6eebffbfa5840d9205339fa9b"
)

package() {
  cd "${srcdir}"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
