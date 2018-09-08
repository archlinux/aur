# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname='php-recode'
pkgver=7.2.9
pkgrel=1
pkgdesc="PHP recode extension"
arch=('i686' 'x86_64')
license=('PHP')
url='http://www.php.net/recode'
depends=('php' 'recode')
source=("https://php.net/distributions/php-${pkgver}.tar.xz")
sha512sums=('b898e78fcb4aeeb441395dcabe2e7686425487e32dffbf0e99393aedb917da87a744b23f0be557c45e447433c8058df6e53c34869fc2dcf874cc1af97ff8331f')

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
