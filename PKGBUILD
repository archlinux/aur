# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname='php-recode'
pkgver=7.3.18
pkgrel=2
pkgdesc="PHP recode extension"
arch=('i686' 'x86_64')
license=('PHP')
url='http://www.php.net/recode'
depends=('php<=7.4.0' 'recode')
source=("https://php.net/distributions/php-${pkgver}.tar.xz")
sha512sums=('e626091c835f6d165ff48ae3be8ddf7a66b0a320c6d77dc98fb73235d560814c180112a9e5478a5b3b6bb01ed99a50f8025fdc3d1ef80cca59e04ac248f9b0bf')

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
