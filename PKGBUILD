# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname='php-recode'
pkgver=7.3.19
pkgrel=1
pkgdesc="PHP recode extension"
arch=('i686' 'x86_64')
license=('PHP')
url='http://www.php.net/recode'
depends=('php<=7.4.0' 'recode')
source=("https://php.net/distributions/php-${pkgver}.tar.xz")
sha512sums=('f37800d9e1bf808ad1099f6190965cc75781e7bf6d2c341a7143aca435abc9974a2987cbfeb8c2b35805c946218343612906fde3cc84b195c2c586945869b760')

build() {
    cd "${srcdir}/php-${pkgver}/ext/recode"

    phpize
    ./configure
    make
}

package() {
    cd "${srcdir}/php-${pkgver}/ext/recode"

    make install INSTALL_ROOT="${pkgdir}"
}
