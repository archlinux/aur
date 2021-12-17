# Maintainer: a821
# Contributor: Stefan Auditor <stefan.auditor@erdfisch.de>

pkgname=php-humbug-box-bin
pkgver=3.14.0
pkgrel=1
pkgdesc='Fast, zero config application bundler with PHARs'
arch=('any')
url='https://github.com/humbug/box'
license=('MIT')
depends=('php')
provides=('php-box')
conflicts=('php-box')
install=php-humbug-box.install
source=(
  "${pkgname}-${pkgver}.phar::https://github.com/humbug/box/releases/download/${pkgver}/box.phar"
  "${pkgname}-${pkgver}.LICENSE::https://raw.githubusercontent.com/humbug/box/${pkgver}/LICENSE"
)
sha512sums=('bc4b1f2677b249d7039ec528594be911b7918cd37d85c6521e1297d1449a27fadded091b6c86852c93d44f16a265c8086d0a819bff8302ef1b5fa7ebaf927e5f'
            '4574410c9a00c41e11d166bcc0d44b4e31b5beaf24bf498a608ebf611e86466a3a61549da6d608b714b3c32c5c361a1514baf38e4db2a5fc0a0d36b69169cb50')

package() {
  install -D -m644 "${pkgname}-${pkgver}.LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/box.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/box.phar" "${pkgdir}/usr/bin/box"
}
