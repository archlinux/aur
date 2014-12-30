# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds

pkgname="phpcpd"
pkgver=2.0.1
pkgrel=3
pkgdesc="Copy/Paste Detector (CPD) for PHP code."
url="https://github.com/sebastianbergmann/phpcpd"
license="BSD"
arch=("any")
depends=("php>=5.3.3")
source=(
  "https://phar.phpunit.de/${pkgname}-${pkgver}.phar"
  "LICENSE"
)
sha1sums=(
  "f9fb98b688092603adff5ca0f1264fcf77674f90"
  "6e7d5c0718a2559eb09bd1456606cd1d5ac90dc7"
)
sha256sums=(
  "3060ec805184c4cc31c45a81d456f74dcca9ca05efa662442ef9bf74ffa86e7c"
  "b107a0992a839dfb3eee3844d7d680fa62dcc37a5b496ae987b695ad86976e02"
)

package() {
  cd "${srcdir}"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
