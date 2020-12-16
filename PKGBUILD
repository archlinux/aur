# Maintainer: William Brown <glowinthedarkcia@horsefucker.org>
# Contributor: Cobalt Space <cobaltspace@protonmail.com>
pkgname="ftba"
pkgver="202011261605_2be2c6a678_release"
pkgrel="4"
arch=("any")
pkgdesc="Offers many different styles of Minecraft modpacks to the community."
source=("https://apps.modpacks.ch/FTBApp/release/${pkgver//_/-}/FTBA_linux_${pkgver//_/-}.deb" "ftbapp.desktop")
sha256sums=("647a46aad94840dddf35e110317cf0504061eadc553e8d84a1758c61bccf28ce" "72e6e0b01e790e416ab1ac215b7179f968156d10be5b36fad656a4f084778db6")
license=("LGPL2")
depends=("java-runtime=8" "java-runtime=11")
package() {
	tar -C "$pkgdir" -xzf "$srcdir/data.tar.gz"
	mkdir -p $pkgdir/usr/{bin,share/applications}
	cp "$srcdir/ftbapp.desktop" "$pkgdir/usr/share/applications"
	rm -R $pkgdir/opt/FTBA/{jre,bin/{ftbapp.app,{,**/}*.{exe,dll}}}
	chmod +x "$pkgdir/opt/FTBA/bin/ftb-app"
	cd "$pkgdir"
	ln -rs ./opt/FTBA/FTBApp ./usr/bin
}
