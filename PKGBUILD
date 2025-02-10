# Maintainer: <max at swk-web.com>

_pkgname=phpstan
pkgname=${_pkgname}-bin
pkgver=2.1.4
pkgrel=1
pkgdesc="PHP Static Analysis Tool - finding errors in your code without actually running it"
provides=('phpstan' 'php-stan')
conflicts=('phpstan' 'php-stan')
arch=('any')
url="https://github.com/phpstan/phpstan"
license=('MIT')
depends=('php>=7.4.0')
source=("phpstan-${pkgver}.phar::https://github.com/phpstan/phpstan/releases/download/${pkgver}/phpstan.phar"
        "phpstan-${pkgver}.phar.asc::https://github.com/phpstan/phpstan/releases/download/${pkgver}/phpstan.phar.asc"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/phpstan/phpstan/${pkgver}/LICENSE")
validpgpkeys=('CA7C2C7A30C8E8E1274A847651C67305FFC2E5C0')
sha256sums=('2bdf163b513e79fa1ae26e97c90511fc09de1bf46d77e9f20d3f316a5e7ffc4b'
            'SKIP'
            'f9e4f43eb1c32f7c4f5bcdb0860de5ba71712c3c1547eeb0d1e4b3c43313ec81')

package() {
  install -D -m 644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/phpstan-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/phpstan.phar"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/phpstan.phar" "${pkgdir}/usr/bin/phpstan"
}
