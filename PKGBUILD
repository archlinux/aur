pkgname=termius-app
pkgver=4.7.2
pkgrel=1
pkgdesc="the SSH client that works on Desktop"
arch=('x86_64')
url="https://www.termius.com/"
license=('GPL')
depends=('desktop-file-utils' 'gconf' 'hicolor-icon-theme' 'libappindicator-gtk2' 'libnotify' 'libxss' 'libxtst' 'nss')
source=("Termius.deb::https://www.termius.com/download/linux/Termius.deb")
noextract=("Termius.deb")
md5sums=("2b82c796e2b9bf17f14d93d31511e097")
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
