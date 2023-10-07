# Maintainer: Ricard Lado <ricard@lado.one>

pkgname=oink
pkgver=1.0.0
pkgrel=1
pkgdesc="A lightweight DDNS client for Porkbun "
arch=(x86_64)
url="https://github.com/RLado/Oink"
license=('MIT')
depends=('glibc')
makedepends=('go')
backup=(etc/oink_ddns/config.json)
source=("https://github.com/RLado/Oink/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f227fdb94b6503ff4358eb1252ef96b10fc6f2773dc49ad4424151a65dc49dc1')

build() {
	cd "Oink-${pkgver}"
	make
}

package() {
	cd "Oink-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}

