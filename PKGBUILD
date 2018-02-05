# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname='php-recode'
pkgver=7.2.2
pkgrel=1
pkgdesc="PHP recode extension"
arch=('i686' 'x86_64')
license=('PHP')
url='http://www.php.net/recode'
depends=('php' 'recode')
source=("https://php.net/distributions/php-${pkgver}.tar.xz")
md5sums=('d6358fd1e5f9d458878a6ece23c56f99')

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
