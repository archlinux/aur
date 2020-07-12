# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname='php-recode'
pkgver=7.3.20
pkgrel=2
pkgdesc="PHP recode extension"
arch=('i686' 'x86_64')
license=('PHP')
url='https://www.php.net/recode'
depends=('php<=7.4.0' 'recode')
source=("https://php.net/distributions/php-${pkgver}.tar.xz")
sha512sums=('4d035e7420ceb64d912a1936db5d311c06c61d09c9d4665c27fba9709fe45b30d5771bb485fb24393d9ee689a0f7ddcbc577e9ee7a7b31341b0203f1b805b886')

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
