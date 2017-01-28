# Maintainer: Clement Poisson <clement@poisson.me>
pkgname=kx3util
pkgver=1.16.6.25
pkgrel=1
epoch=
pkgdesc="Elecraft KX3 Utility"
arch=("x86_64")
url="http://www.elecraft.com/KX3/KX3_software.htm"
license=("custom")
groups=()
depends=("lib32-glibc" "lib32-libstdc++5" "lib32-gtk2")
makedepends=()
checkdepends=()
optdepends=()
provides=('kx3util')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.elecraft.com/software/KX3/KX3UtilityLINUX_1_16_6_25.tgz")
noextract=()
md5sums=('1c63b7f43b994ddf4f1c12add2cfaa36')
validpgpkeys=()

package() {
	mkdir -p $pkgdir/usr/share/applications

	cp ../kx3util.desktop $pkgdir/usr/share/applications

	cd "$srcdir/kx3util_1_16_6_25"

	mkdir -p $pkgdir/usr/local/bin 
	cp kx3util $pkgdir/usr/local/bin

	mkdir -p $pkgdir/usr/local/lib/kx3util 
	cp 'kx3util Libs'/* $pkgdir/usr/local/lib/kx3util
	ln -s "$pkgdir/usr/local/lib/kx3util" "$pkgdir/usr/local/bin/kx3util Libs"

	mkdir -p $pkgdir/etc/kx3util
	cp -r 'Help' $pkgdir/etc/kx3util
	ln -s "$pkgdir/etc/kx3util/Help" "$pkgdir/usr/local/bin/Help"
	chmod +r -R "$pkgdir/etc/kx3util/Help"
}
