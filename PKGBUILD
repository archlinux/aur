# Maintainer: Freedownloadmanager Team <support@freedownloadmanager.org>
# Contributor: Rizwan Hasan <rizwan.hasan486@gmail.com>

pkgname=freedownloadmanager
pkgver=6.7.0.2439
pkgrel=1
pkgdesc="FDM is a powerful modern download accelerator and organizer."
arch=('x86_64')
url="https://www.freedownloadmanager.org/"
license=('Adware')
depends=('openssl' 'xdg-utils' 'ffmpeg')
source=("${pkgname}-${pkgver}.deb::https://dn3.freedownloadmanager.org/6/latest/freedownloadmanager.deb")
noextract=("${pkgname}-${pkgver}.deb")
md5sums=("98f74fd9abc3471b05c4c93e2fd1f78f")

prepare() {
	ar -x ${pkgname}-${pkgver}.deb
	mkdir ${pkgname}-${pkgver}
	tar -xf data.tar.xz --directory="${pkgname}-${pkgver}"
}

package() {
	cd "${pkgname}-${pkgver}"
	cp -r ./ ${pkgdir}/
}
