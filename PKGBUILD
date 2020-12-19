# Maintainer: William Brown <glowinthedarkcia@horsefucker.org>
# Maintainer: Cobalt Space <cobaltspace@protonmail.com>
pkgname=ftba
pkgver=202012101153_ce008c54b4
pkgrel=1
arch=(any)
pkgdesc="Offers many different styles of Minecraft modpacks to the community."
source=("https://apps.modpacks.ch/FTBApp/release/${pkgver//_/-}-release/FTBA_linux_${pkgver//_/-}-release.deb" "ftbapp.desktop")
sha256sums=('70c40e9db84b80679ddb919d7c62f576f3b8400654c3f46de40c98e8341b43a1'
            '72e6e0b01e790e416ab1ac215b7179f968156d10be5b36fad656a4f084778db6')
license=("LGPL2")
depends=("java-runtime=8" "java-runtime=11")
package() {
	cd "$pkgdir"
	tar -xzf "$srcdir/data.tar.gz"
	mkdir -p usr/{bin,share/applications}
	cp "$srcdir/ftbapp.desktop" usr/share/applications
	rm -R opt/FTBA/{jre,bin/{ftbapp.app,{,**/}*.{exe,dll}}}
	chmod +x opt/FTBA/bin/ftb-app
	ln -rs ./opt/FTBA/FTBApp ./usr/bin
}
