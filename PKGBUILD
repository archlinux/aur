# Maintainer: Ruben Kelevra <ruben@freifunk-nrw.de>

pkgname=php-rql
pkgver=2.0.1
pkgrel=1
pkgdesc="RethinkDB driver for PHP"
arch=(any)
url="https://github.com/danielmewes/php-rql"
_watch=('https://danielmewes.github.io/php-rql/','Documentation <small>v([\d.]*)</small>')
license=('Apache License 2.0')
depends=('php')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/danielmewes/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('2e5fa5830ed95000435265f90780a97bdf810da0972656d6eddbb64ccfe9193eedc01183ba23e967cc78af3008dc1f2ff7b02f2ea5f69ad0f3eeb5e1084bf7c2')

prepare() {
    cd "$pkgname-$pkgver"
}

build() {
    cd "$pkgname-$pkgver"
}

package() {
    cd "$pkgname-$pkgver"
    echo 'cleaning up unneeded files...'
    rm composer.json README.md 
    rm -r tests docs
    echo 'move files...'
    cp -a src/ "${pkgdir}"/usr/include/php/
}
