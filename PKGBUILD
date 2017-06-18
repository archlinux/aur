# Maintainer: JKA Network (JoseluCross, Kprkpr, Yukialba) <contacto@jkanetwork.com>
pkgname=telepad
pkgver=1.0.7
pkgrel=4
pkgdesc="Telepad desktop application. This software communicates with the Telepad mobile application in order to use a mobile/tablet as a remote mouse and keyboard."
arch=('x86_64' 'i686')
url="http://www.telepad-app.com/en/"
license=('custom')
provides=('telepad' 'telepad-app')
depends=('bluez-libs' 'libx11' 'libxext' 'libxtst' 'jre8-openjdk' 'classpath')
options=(!emptydirs)
source=("https://launchpad.net/~pelle-vincent-n/+archive/ubuntu/telepad-ppa/+files/${pkgname}_${pkgver}.orig.tar.xz")
md5sums=('9bd69e4f4757ff61683d17da044c2453')
build() {
	cd "${pkgname}-${pkgver}.orig"
	./configure
	make
}
package() {
	cd "${pkgname}-${pkgver}.orig"
	make DESTDIR="$pkgdir/" install
	install -D -m644 debian/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
