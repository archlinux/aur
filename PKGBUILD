# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/php-humbug-box

pkgname=php-humbug-box-bin
pkgver=3.13.0
pkgrel=2
pkgdesc='Fast, zero config application bundler with PHARs.'
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
sha512sums=('a1f93271abe7ef53288a605d252c825ee0d7d7065c7b35b46340699b90dc039e05454028c57cc8fdd4907840effb47bcc7839fd88fa1de15916c86ec6bde987b'
            '4574410c9a00c41e11d166bcc0d44b4e31b5beaf24bf498a608ebf611e86466a3a61549da6d608b714b3c32c5c361a1514baf38e4db2a5fc0a0d36b69169cb50')

package() {
  install -D -m644 "${pkgname}-${pkgver}.LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/box.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/box.phar" "${pkgdir}/usr/bin/box"
}
