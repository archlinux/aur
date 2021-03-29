# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/php-humbug-box

_pkgname='php-humbug-box'
pkgname="${_pkgname}-bin"
pkgver=3.11.1
pkgrel=2
pkgdesc='Fast, zero config application bundler with PHARs.'
arch=('any')
url='https://github.com/humbug/box'
license=('MIT')
provides=('php-box')
conflicts=('php-box')
install="${_pkgname}.install"
source=(
  "https://github.com/humbug/box/releases/download/${pkgver}/box.phar"
  "https://raw.githubusercontent.com/humbug/box/${pkgver}/LICENSE"
)
sha512sums=('cd0a8bc290e0cfb51367480938b31fa8706e441c8931a46ea9faac32c521a04fb7377d589aca8167e83071dbd6d21a23417e496049ea01734ced025c753f2808'
            '4574410c9a00c41e11d166bcc0d44b4e31b5beaf24bf498a608ebf611e86466a3a61549da6d608b714b3c32c5c361a1514baf38e4db2a5fc0a0d36b69169cb50')

package() {
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m755 "${srcdir}/box.phar" "${pkgdir}/usr/share/webapps/bin/box.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/box.phar" "${pkgdir}/usr/bin/box"
}
