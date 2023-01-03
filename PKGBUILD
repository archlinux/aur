# Maintainer: <max at swk-web.com>

pkgname=php-stan
pkgver=1.9.6
pkgrel=1
pkgdesc="PHP Static Analysis Tool - finding errors in your code without actually running it"
arch=('any')
url="https://github.com/phpstan/phpstan"
license=('MIT')
depends=('php>=7.2.0')
source=("phpstan-${pkgver}.phar::https://github.com/phpstan/phpstan/releases/download/${pkgver}/phpstan.phar"
        "phpstan-${pkgver}.phar.asc::https://github.com/phpstan/phpstan/releases/download/${pkgver}/phpstan.phar.asc"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/phpstan/phpstan/${pkgver}/LICENSE")
validpgpkeys=('D32680D5957DC7116BE29C14CF1A108D0E7AE720')
sha256sums=('e92a272d3791ff8776da7cd14c404c43ae05ce6e9aea32b2b3748c522c77d3db'
            'SKIP'
            'c4fa9cc466f14e40ce3011670ca4eb2596e107007e83aa6f5c139cf8adcb776f')

package() {
  install -D -m 644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/phpstan-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/phpstan.phar"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/phpstan.phar" "${pkgdir}/usr/bin/phpstan"
}
