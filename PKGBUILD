# Maintainer: Eragon <eragon at eragon dot re>

pkgname=touist-jar
pkgver=3.5.2
pkgrel=1
pkgdesc="TouIST, the IDE & Language for Logic"
arch=("any")
url="https://www.irit.fr/touist"
license=('MIT')
depends=("java-runtime>=8")
provides=("touist")
_zipname="TouIST-jar-v$pkgver-linux-x86_64.zip"
source=("https://github.com/touist/touist/releases/download/v$pkgver/$_zipname" "touist.desktop")
sha256sums=('50599539b19093ca4abdeacf0b56864e67a615e9e140d174d81a789e9c81d60c'
		'5938c09636d7210ca6147cb412f6f9ec4f05f20f723dcefa60533ada1b46aab0')

build() {
	unzip -qo $_zipname
	unzip -qo touist.jar
}

package() {
	mkdir -p $pkgdir/opt/touist
	cp touist.jar $pkgdir/opt/touist/touist.jar
	cp images/logo.png $pkgdir/opt/touist/touist_icon.png
	mkdir -p $pkgdir/usr/bin/
	cp touist $pkgdir/usr/bin/
	mkdir -p $pkgdir/usr/share/applications/
	cp touist.desktop $pkgdir/usr/share/applications/touist.desktop
}
