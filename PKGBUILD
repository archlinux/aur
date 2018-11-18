# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname='php-recode'
pkgver=7.2.12
pkgrel=1
pkgdesc="PHP recode extension"
arch=('i686' 'x86_64')
license=('PHP')
url='http://www.php.net/recode'
depends=('php' 'recode')
source=("https://php.net/distributions/php-${pkgver}.tar.xz")
sha512sums=('bbeaed1278d0d2f1ecb2249dab1ebaab1489ef43be0797dac57d8b523d8e5d284166e6cbf52095f5d34eef447fbdeb0c6916caaa5770221a180ec064f4ffcad8')

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
