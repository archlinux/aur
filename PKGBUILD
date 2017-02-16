# Maintainer: Ruben Kelevra <ruben@freifunk-nrw.de>

pkgname=php-rql
pkgver=2.3.0
pkgrel=3
pkgdesc="RethinkDB driver for PHP"
arch=(any)
url="https://github.com/danielmewes/php-rql"
_watch=('https://danielmewes.github.io/php-rql/','Documentation <small>v([\d.]*)</small>')
license=('Apache License 2.0')
depends=('php')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/danielmewes/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('a03baf1cff017703ca56ee2edb9a1525b2be7345b2eccceb5f1763aba57320e49b7794569142d62f241fce9aa444bea562dc270a11064ed51f4a025f8e9546a3')

prepare() {
    cd "$pkgname-$pkgver"
}

build() {
    cd "$pkgname-$pkgver"
}

package() {
    cd "$pkgname-$pkgver"
    echo 'cleaning up unneeded files...'
    rm composer.json README.md || true
    rm -r tests docs pb4php || true
    echo 'move files...'
    mkdir -p "${pkgdir}"/usr/include/php/
    cp -a rdb/ "${pkgdir}"/usr/include/php/
}
