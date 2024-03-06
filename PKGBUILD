# Maintainer: Ricard Lado <ricard@lado.one>

pkgname=oink
pkgver=1.1.0
pkgrel=1
pkgdesc='A lightweight DDNS client for Porkbun'
arch=(x86_64)
url='https://github.com/RLado/Oink'
license=('MIT')
depends=('glibc')
makedepends=('go')
backup=(etc/oink_ddns/config.json)
source=("https://github.com/RLado/Oink/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('456d683fbf05772cbf10650f1f0a2d2a6eed754cfcdab4ed03ba986161d4defd')

build() {
	cd "Oink-${pkgver}"
	make
}

package() {
	cd "Oink-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}

