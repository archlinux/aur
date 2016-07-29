# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=php56-mailparse
pkgver=2.1.6
pkgrel=1
pkgdesc="A PHP extension for parsing and working with email messages"
arch=('i686' 'x86_64')
license=('PHP')
url="https://php.net/mailparse"
depends=('php56')
source=("http://pecl.php.net/get/mailparse-${pkgver}.tgz")
md5sums=('0f84e1da1d074a4915a9bcfe2319ce84')

build() {
    cd "${srcdir}/mailparse-${pkgver}"

    phpize56
    ./configure
    make
}

package() {
    cd "${srcdir}/mailparse-${pkgver}"

    make install INSTALL_ROOT="${pkgdir}"
}
