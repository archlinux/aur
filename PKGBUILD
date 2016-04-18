# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds

pkgname="phpcpd"
pkgver=2.0.4
pkgrel=1
pkgdesc="Copy/Paste Detector (CPD) for PHP code."
url="https://github.com/sebastianbergmann/phpcpd"
license=("BSD")
arch=("any")
depends=("php>=5.3.3")
source=(
  "https://phar.phpunit.de/${pkgname}-${pkgver}.phar"
  "LICENSE"
)
install="${pkgname}.install"
sha256sums=(
  "491eeac71f1421395648ff079b60fe4858217b70d66eaa07644351f2699c38fe"
  "b107a0992a839dfb3eee3844d7d680fa62dcc37a5b496ae987b695ad86976e02"
)

package() {
  cd "${srcdir}"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
