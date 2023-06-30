# Maintainer: <max at swk-web.com>

_pkgname=phpstan
pkgname=${_pkgname}-bin
pkgver=1.10.22
pkgrel=1
pkgdesc="PHP Static Analysis Tool - finding errors in your code without actually running it"
provides=('phpstan' 'php-stan')
conflicts=('phpstan' 'php-stan')
arch=('any')
url="https://github.com/phpstan/phpstan"
license=('MIT')
depends=('php>=7.2.0')
source=("phpstan-${pkgver}.phar::https://github.com/phpstan/phpstan/releases/download/${pkgver}/phpstan.phar"
        "phpstan-${pkgver}.phar.asc::https://github.com/phpstan/phpstan/releases/download/${pkgver}/phpstan.phar.asc"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/phpstan/phpstan/${pkgver}/LICENSE")
validpgpkeys=('CA7C2C7A30C8E8E1274A847651C67305FFC2E5C0')
sha256sums=('6474f0f489859fc460bff343f06767d7a8b135e723075644052825bc9bc4102b'
            'SKIP'
            'c4fa9cc466f14e40ce3011670ca4eb2596e107007e83aa6f5c139cf8adcb776f')

package() {
  install -D -m 644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/phpstan-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/phpstan.phar"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/phpstan.phar" "${pkgdir}/usr/bin/phpstan"
}
