# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=libmseed
pkgver=3.1.3
pkgrel=1
pkgdesc="A framework for manipulation of SEED (Standard for the Exchange of Earthquake Data) data records."
arch=("x86_64")
url="https://github.com/iris-edu/libmseed"
license=('Apache-2.0')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a757892777b5a028064975ea71ee62c9e933e8485e5daae81fd4a1babe109225')

build() {
	cd "${pkgname}-${pkgver}"
	make shared
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" PREFIX="/usr" install
}
# vim:set ts=4 sw=4 et:
