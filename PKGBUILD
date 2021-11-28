# Maintainer: js6pak <kubastaron@hotmail.com>

pkgname=betacraft-launcher-bin
pkgver=1.09_15
pkgrel=1
pkgdesc="A Minecraft launcher aims to provide easy access to old versions and improve the overall game experience in those versions."
arch=('x86_64')
url="https://github.com/Moresteck/BetaCraft-Launcher-Java"
license=('GPL3')
depends=('java-runtime=8' 'java8-openjfx')
provides=("${pkgname%-bin}")

source=("$pkgname-$pkgver.jar::https://github.com/Moresteck/BetaCraft-Launcher-Java/releases/download/$pkgver/launcher-$pkgver.jar"
	'betacraft-launcher'
	'betacraft-launcher.png'
	'betacraft-launcher.desktop')
sha256sums=('058f827316e99a1c2be2f3daa8a10e79798184042434313a5c9338563988fc4a'
            '31bded76e46fd1538fb131fad774d402685b341df861b3f538379d926e5d4d6a'
            '29df44a3d868560ad69ed8f4beb8772b246ceedc8bfa70a8c39513695c2b7ea6'
            '260020b2dcb68c46ec4d13112289d21fdff962df8345918a612d3b3fb0359551')

package() {
	cd "$srcdir"

	mkdir -p "$pkgdir/opt/betacraft-launcher/"
	chmod -R 755 "$pkgdir/opt/betacraft-launcher/"

	install -D -m755 "$srcdir/betacraft-launcher" "$pkgdir/usr/bin/betacraft-launcher"

	install -D -m644 "$srcdir/$pkgname-$pkgver.jar" "$pkgdir/opt/betacraft-launcher/BetaCraft-Launcher-Java.jar"

	install -D -m644 "$srcdir/betacraft-launcher.png" "$pkgdir/usr/share/pixmaps/betacraft-launcher.png"
	install -D -m644 "$srcdir/betacraft-launcher.desktop" "$pkgdir/usr/share/applications/betacraft-launcher.desktop"
}
