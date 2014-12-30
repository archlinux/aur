# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds

pkgname="phpmd"
pkgver=2.1.3
pkgrel=2
pkgdesc="Takes a given PHP source code base and look for several potential problems within that source."
url="http://phpmd.org/"
license="BSD"
arch=("any")
depends=("php>=5.3.0")
source=(
  "${pkgname}-${pkgver}.phar::http://static.phpmd.org/php/${pkgver}/${pkgname}.phar"
  "LICENSE"
)
install="$pkgname.install"
sha1sums=(
  "a390c80f8108a07fb2d2bb91dfc175fa3a44371c"
  "49a94fd699270de8599423fd3302cb6880f9c224"
)
sha256sums=(
  "acbc27fba706654d2a0c1358fbaf5b5a15159214aaba65904cef4faed62a78e3"
  "faad499ee7fe2e75e18565c6b6b5cf43a3dc97a6eebffbfa5840d9205339fa9b"
)

package() {
  cd "${srcdir}"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
