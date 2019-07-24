pkgname=termius-app
pkgver=4.9.5
pkgrel=1
pkgdesc="Desktop SSH Client"
arch=('x86_64')
url="https://www.termius.com/"
license=('GPL')
depends=('desktop-file-utils' 'gconf' 'hicolor-icon-theme' 'libappindicator-gtk2' 'libnotify' 'libxss' 'libxtst' 'nss')
source=("Termius.deb::https://www.termius.com/download/linux/Termius.deb")
noextract=("Termius.deb")
md5sums=("db401978f7bded96d008d908a7e1c027")
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
