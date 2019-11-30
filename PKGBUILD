pkgname=termius-app
pkgver=5.0.6
pkgrel=1
pkgdesc="Desktop SSH Client"
arch=('x86_64')
url="https://www.termius.com/"
license=('GPL')
depends=('desktop-file-utils' 'gconf' 'hicolor-icon-theme' 'libappindicator-gtk2' 'libnotify' 'libxss' 'libxtst' 'nss')
source=("${pkgname}-${pkgver}.deb::https://www.termius.com/download/linux/Termius.deb")
noextract=("${pkgname}-${pkgver}.deb")
md5sums=("b9d44ae5ca75a352070be23a6e9c70f6")
validpgpkeys=()

prepare() {
	ar -x Termius.deb
	mkdir ${pkgname}-${pkgver}
	tar -xf data.tar.xz --directory="${pkgname}-${pkgver}"
}

package() {
	cd "${pkgname}-${pkgver}"
	cp -r ./ ${pkgdir}/
}
