# Maintainer: a821
# Contributor: Stefan Auditor <stefan.auditor@erdfisch.de>

pkgname=php-humbug-box-bin
pkgver=4.3.7
pkgrel=1
pkgdesc='Fast, zero config application bundler with PHARs'
arch=('any')
url='https://github.com/box-project/box'
license=('MIT')
depends=('php')
provides=('php-box')
conflicts=('php-box')
install=php-humbug-box.install
source=(
  "${pkgname}-${pkgver}.phar::https://github.com/box-project/box/releases/download/${pkgver}/box.phar"
  "${pkgname}-${pkgver}.LICENSE::https://raw.githubusercontent.com/box-project/box/${pkgver}/LICENSE"
)
sha512sums=('4b86e75c39267027aa4fc21667a46e6ea8ba0d61080bf3dc6f266f5e39b74e8b13d6cee114443b79d1e9991f601c0cedc8bd842bfbe7421d0a5cc33877daedff'
            '4574410c9a00c41e11d166bcc0d44b4e31b5beaf24bf498a608ebf611e86466a3a61549da6d608b714b3c32c5c361a1514baf38e4db2a5fc0a0d36b69169cb50')

package() {
  install -D -m644 "${pkgname}-${pkgver}.LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/box.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/box.phar" "${pkgdir}/usr/bin/box"
}
