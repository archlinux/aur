# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds

pkgname="phpdcd"
pkgver=1.0.2
pkgrel=3
pkgdesc="Dead Code Detector (DCD) for PHP code."
url="https://github.com/sebastianbergmann/phpdcd"
license="BSD"
arch=("any")
depends=("php>=5.3.3")
source=(
  "https://phar.phpunit.de/${pkgname}-${pkgver}.phar"
  "LICENSE"
)
sha1sums=(
  "f2052a9c143d79057257497e5fcf3c7275ebd065"
  "11946e2ec7349724cf1cd711cd7fddf2dae82475"
)
sha256sums=(
  "28301205d671a6e564e72c5b249ef31600d1fdda6958b35bd2a9b2e0f2f54ede"
  "fc0ec35ca43801ccb61680b806558bae66301750e25046c7b5633c239855a87d"
)

package() {
  cd "${srcdir}"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
