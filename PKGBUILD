# Maintainer: Ricard Lado <ricard@lado.one>

pkgname=oink
pkgver=1.4.0
pkgrel=1
pkgdesc='A lightweight DDNS client for Porkbun'
arch=(x86_64)
url='https://github.com/RLado/Oink'
license=('MIT')
depends=('glibc')
makedepends=('go')
backup=(etc/oink_ddns/config.json)
source=("https://github.com/RLado/Oink/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2158b705ce7467a9fc7484a1048d1e57b437197ab0165a1330270b3e67b24d31')

build() {
	cd "Oink-${pkgver}"
	make
}

package() {
	cd "Oink-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}

