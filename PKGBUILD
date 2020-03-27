# Maintainer: Freedownloadmanager Team <support@freedownloadmanager.org>
# Contributor: Rizwan Hasan <rizwan.hasan486@gmail.com>

pkgname=freedownloadmanager
pkgver=6.8.1.2780
pkgrel=1
pkgdesc="FDM is a powerful modern download accelerator and organizer."
arch=('x86_64')
url="https://www.freedownloadmanager.org/"
license=('Adware')
depends=('openssl' 'xdg-utils' 'ffmpeg')
source=("${pkgname}.deb::https://dn3.freedownloadmanager.org/6/latest/freedownloadmanager.deb")
noextract=("${pkgname}.deb")
md5sums=("07e555ba6a8621ffe38cabbd033597dc")

prepare() {
	ar -x ${pkgname}.deb
	mkdir ${pkgname}-${pkgver}
	tar -xf data.tar.xz --directory="${pkgname}-${pkgver}"
}

package() {
	cd "${pkgname}-${pkgver}"
	cp -r ./ ${pkgdir}/
}
