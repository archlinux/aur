# Maintainer: William Brown <glowinthedarkcia@horsefucker.org>
pkgname="ftba"
pkgver="202007161516_479dedc615_release"
_version="202007161516-479dedc615-release"
pkgrel="1"
arch=("any")
pkgdesc="Offers many different styles of Minecraft modpacks to the community."
source=("https://apps.modpacks.ch/FTBApp/release/$_version/FTBA_linux_$_version.deb" "run-ftb.sh" "ftbapp.desktop")
_file="FTBA_linux_$_version.deb"
noextract=("$_file" "run-ftb.sh" "ftbapp.desktop")
md5sums=("81e16f05647b8b6888c1613eed3779a4" "838d9b7c27dbbda0dcd8cc59d301e0e0" "0775efb989c973eb7a080e6dae2f9e8d")
license=("LGPL2")
depends=("java-runtime")
prepare() {
	cd "$srcdir"
	ar -xf "$_file"
	tar -xzf data.tar.gz
}
package() {
	cd "$pkgdir"
	cp -R "$srcdir/opt" .
	mkdir -p usr/bin
	mkdir -p usr/share/applications
	cp "$srcdir/run-ftb.sh" usr/bin/FTBApp
	cp "$srcdir/ftbapp.desktop" usr/share/applications
}
