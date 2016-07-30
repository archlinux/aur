# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname='php-recode'
pkgver=7.0.9
pkgrel=2
pkgdesc="PHP recode extension"
arch=('i686' 'x86_64')
license=('PHP')
url='http://www.php.net/recode'
depends=('php' 'recode')
source=("https://www.php.net/distributions/php-${pkgver}.tar.xz")
md5sums=('6294813fb3c8158cfde74302f573cac7')

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
