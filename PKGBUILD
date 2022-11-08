# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=libmseed
pkgver=2.19.8
pkgrel=1
pkgdesc="A framework for manipulation of SEED (Standard for the Exchange of Earthquake Data) data records."
arch=("x86_64")
url="https://github.com/iris-edu/libmseed"
license=('Apache-2.0')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('10ac972cb4e76c8d6aa27bf9f56fc59d1922991477d9ddefd375b89dba9e93f6')

build() {
	cd "${pkgname}-${pkgver}"
	make shared
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" PREFIX="/usr" install
}
# vim:set ts=4 sw=4 et:
