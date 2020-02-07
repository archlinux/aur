pkgname=termius-app
pkgver=5.4.1
pkgrel=1
pkgdesc="Desktop SSH Client"
arch=('x86_64')
url="https://www.termius.com/"
license=('GPL')
depends=('desktop-file-utils' 'gconf' 'hicolor-icon-theme' 'libappindicator-gtk2' 'libnotify' 'libxss' 'libxtst' 'nss')
source=("${pkgname}-${pkgver}.deb::https://www.termius.com/download/linux/Termius.deb")
noextract=("${pkgname}-${pkgver}.deb")
md5sums=("5bac22b9fb5c7101405a6abaed2f992a")
validpgpkeys=()

prepare() {
	ar -x ${pkgname}-${pkgver}.deb
	#mkdir ${pkgname}-${pkgver}
	tar -xf data.tar.xz #--directory="${pkgname}-${pkgver}"
}

package() {
	#cd "${pkgname}-${pkgver}"
	cd ${srcdir}
	#rm -rf etc
	rm -rf control.tar.gz data.tar.xz ${pkgname}-${pkgver}.deb debian-binary etc
	cp -r ./ ${pkgdir}/
}
