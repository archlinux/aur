# Maintainer: Ricard Lado <ricard@lado.one>
pkgname=oink
pkgver=0.1.2
pkgrel=1
pkgdesc="A lightweight DDNS client for Porkbun "
arch=(x86_64)
url="https://github.com/RLado/Oink"
license=('MIT')
depends=('glibc')
makedepends=('go')
backup=(etc/oink_ddns/config.json)
source=("https://github.com/RLado/Oink/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0365374054fdd76a0668b7a57ab42ff94146353a3aba712517112075eec3ba35')

build() {
	cd "Oink-${pkgver}"
	make
}

package() {
	cd "Oink-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}

