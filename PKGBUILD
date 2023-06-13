# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds

pkgname="phpcpd"
pkgver=6.0.2
pkgrel=1
pkgdesc="Copy/Paste Detector (CPD) for PHP code."
url="https://github.com/sebastianbergmann/phpcpd"
license=("BSD")
arch=("any")
depends=("php>=7.1")
source=(
  "https://phar.phpunit.de/${pkgname}-${pkgver}.phar"
  "LICENSE"
)
install="${pkgname}.install"
sha256sums=('35f620c85128f5e705493fd6d1445aa16e806b6ed39ab88bf8bd7ff1f756ebbf'
            'a1c3d70730486361b39b935b6e84f67be22ceae5377be4ab1c3e2eee61a487ec')

package() {
  cd "${srcdir}"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
