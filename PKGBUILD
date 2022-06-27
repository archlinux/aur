# Maintainer: a821
# Contributor: Stefan Auditor <stefan.auditor@erdfisch.de>

pkgname=php-humbug-box-bin
pkgver=4.0.2
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
sha512sums=('42aaee35e105d94d9e9394d0d0297ad2c872cfaa0c9e6e4fa0bb837e75a85cb7c6a3493efc632ab295d2c4fa773e5353d6cb0175d0353dc13f9bc7ed3d47d1c9'
            '4574410c9a00c41e11d166bcc0d44b4e31b5beaf24bf498a608ebf611e86466a3a61549da6d608b714b3c32c5c361a1514baf38e4db2a5fc0a0d36b69169cb50')

package() {
  install -D -m644 "${pkgname}-${pkgver}.LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/box.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/box.phar" "${pkgdir}/usr/bin/box"
}
