# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname='php-recode'
pkgver=7.1.11
pkgrel=1
pkgdesc="PHP recode extension"
arch=('i686' 'x86_64')
license=('PHP')
url='http://www.php.net/recode'
depends=('php' 'recode')
source=("https://www.php.net/distributions/php-${pkgver}.tar.xz")
md5sums=('bbf4dfe4f501143a1763eb86b6a0a454')

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
