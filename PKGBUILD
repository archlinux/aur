# Maintainer: William Brown <glowinthedarkcia@horsefucker.org>
pkgname="ftba"
pkgver="202011261605_2be2c6a678_release"
_version="202011261605-2be2c6a678-release"
pkgrel="2"
arch=("any")
pkgdesc="Offers many different styles of Minecraft modpacks to the community."
source=("https://apps.modpacks.ch/FTBApp/release/$_version/FTBA_linux_$_version.deb" "run-ftb.sh" "ftbapp.desktop")
_file="FTBA_linux_$_version.deb"
noextract=("$_file" "run-ftb.sh" "ftbapp.desktop")
md5sums=("f41365424850f25c67318f8b2b360684" "838d9b7c27dbbda0dcd8cc59d301e0e0" "caa125e287ab8287587aff53626db48a")
license=("LGPL2")
depends=("java-runtime")
prepare() {
	cd "$srcdir"
	ar -x "$_file"
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
