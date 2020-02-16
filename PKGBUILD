# Maintainer: <max at swk-web.com>

pkgname=php-stan
pkgver=0.12.11
pkgrel=1
pkgdesc="PHP Static Analysis Tool - finding errors in your code without actually running it"
arch=('any')
url="https://github.com/phpstan/phpstan"
license=('MIT')
depends=('php')
source=("phpstan-${pkgver}.phar::https://github.com/phpstan/phpstan/releases/download/${pkgver}/phpstan.phar"
        "phpstan-${pkgver}.phar.asc::https://github.com/phpstan/phpstan/releases/download/${pkgver}/phpstan.phar.asc")
validpgpkeys=('D32680D5957DC7116BE29C14CF1A108D0E7AE720')
sha256sums=('61ad722545b8f708b1ab8f0c31cb720f5bffe681b25eebe90f06d8b2effb10fc'
            'SKIP')

package() {
  install -d "${pkgdir}/usr/share/webapps/bin"
  install -D -m 755 "${srcdir}/phpstan-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/phpstan.phar"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/phpstan.phar" "${pkgdir}/usr/bin/phpstan"
}
