# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=libmseed
pkgver=2.19.6
pkgrel=2
pkgdesc="A framework for manipulation of SEED (Standard for the Exchange of Earthquake Data) data records."
arch=("x86_64")
url="https://github.com/iris-edu/libmseed"
license=('Apache-2.0')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('80b7f653589a30dcb4abcd53fe6bc1276f634262ee673815e12abdc1ff179d1d')

build() {
	cd "${pkgname}-${pkgver}"
	make shared
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir/}" PREFIX=/usr install
}
# vim:set ts=4 sw=4:
