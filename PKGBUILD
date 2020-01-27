# Maintainer: Freedownloadmanager Team <support@freedownloadmanager.org>
# Contributor: Rizwan Hasan <rizwan.hasan486@gmail.com>

pkgname=freedownloadmanager
pkgver=6.7.0.2533
pkgrel=1
pkgdesc="FDM is a powerful modern download accelerator and organizer."
arch=('x86_64')
url="https://www.freedownloadmanager.org/"
license=('Adware')
depends=('openssl' 'xdg-utils' 'ffmpeg')
source=("${pkgname}.deb::https://dn3.freedownloadmanager.org/6/latest/freedownloadmanager.deb")
noextract=("${pkgname}.deb")
md5sums=("ef1a2ffc8387e57184345f1d0e2396c8")

prepare() {
	ar -x ${pkgname}.deb
	mkdir ${pkgname}-${pkgver}
	tar -xf data.tar.xz --directory="${pkgname}-${pkgver}"
}

package() {
	cd "${pkgname}-${pkgver}"
	cp -r ./ ${pkgdir}/
}
