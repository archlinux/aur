# Maintainer: Eragon <eragon at eragon dot re>

pkgname=touist-jar
pkgver=3.5.2
pkgrel=3
pkgdesc="TouIST, the IDE & Language for Logic"
arch=("any")
url="https://www.irit.fr/touist"
license=('MIT')
depends=("java-runtime>=8")
provides=("touist")
_zipname="TouIST-jar-v$pkgver-linux-x86_64.zip"
source=("https://github.com/touist/touist/releases/download/v$pkgver/$_zipname" "touist.desktop" "touist.sh")
sha256sums=('50599539b19093ca4abdeacf0b56864e67a615e9e140d174d81a789e9c81d60c'
		'91d2e4fdb18d833c3939ca87682320bae31989fd1ef950117212e591a1d44277'
		'aeb10050eb85420b518a2865bf9e4c5f1ec356bf675a7d227107e3292f99f6f7')

build() {
	unzip -qo $_zipname
	unzip -qo touist.jar images/logo.png
	rm -rf touist
}

package() {
	mkdir -p $pkgdir/opt/touist
	cp touist.jar $pkgdir/opt/touist/touist.jar
	cp images/logo.png $pkgdir/opt/touist/touist_icon.png
	mkdir -p $pkgdir/usr/bin/
	cp touist.sh $pkgdir/usr/bin/
	mkdir -p $pkgdir/usr/share/applications/
	cp touist.desktop $pkgdir/usr/share/applications/touist.desktop
}
