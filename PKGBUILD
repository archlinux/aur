# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname='php-recode'
pkgver=7.2.10
pkgrel=1
pkgdesc="PHP recode extension"
arch=('i686' 'x86_64')
license=('PHP')
url='http://www.php.net/recode'
depends=('php' 'recode')
source=("https://php.net/distributions/php-${pkgver}.tar.xz")
sha512sums=('aa90fce17034b2649012d66461626ae74c21ea938b1c71c7eb12419e562c641b432df87a7e900c245ad28df39624cf64a1b2f8ffb123608d94cd35e41f09c0fe')

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
