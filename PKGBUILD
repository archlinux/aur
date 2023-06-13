# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-pdepend

pkgname=pdepend
pkgver=2.14.0
pkgrel=1
pkgdesc="A tool for PHP software metrics"
url="http://pdepend.org/"
arch=("any")
license=("BSD")
depends=("php")
install="${pkgname}.install"
source=("https://github.com/pdepend/pdepend/releases/download/${pkgver}/pdepend.phar"
        "https://raw.githubusercontent.com/pdepend/pdepend/${pkgver}/LICENSE"
        "pdepend.install")
sha512sums=('1c2987286fc8ab4bb83d72b6e747af3fbed14af18edcaf356c920d2164dd113ff1cded2a947b6b73ede1be7ec069e38cd5f02233063c912ab07d37ded364aa80'
            '9772652fd67993b6e75b65d3d368210d44058ebd2d78bfca6d3b189ffeaf14d8de56ab1b8e59f7e0e2b4e0ddcdce5bb102100efdb6cce70bfe32229746fae436'
            '918537da7a6431b3c9c2bfd55dd0e317b586924e65a547c4216b58df1f12081737f12af7f19e81365befd15af1ee26046ad7ca086a3c9bde0466c0d9257cd1ac')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/pdepend.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/pdepend"
}
