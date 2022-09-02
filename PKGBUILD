# Maintainer: Isaac Ruben <isaac at rubenfamily dot com>
pkgname='pathplanner-bin'
pkgver="v2022.1.1"
pkgrel=2
pkgdesc="A simple yet powerful motion profile generator for FRC robots"
arch=("x86_64")
url="https://github.com/mjansen4857/pathplanner"
license=('MIT')
provides=("pathplanner")
source=("$pkgname-$pkgver.zip::https://github.com/mjansen4857/pathplanner/releases/download/$pkgver/PathPlanner-linux.zip")
sha256sums=('1d660916c8be468bd3e652450bb73bfdb03359a6c32289114f1643f5fb4a7f64')

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/opt/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	rm "$srcdir/pathplanner-bin-$pkgver.zip"
	cp -r "$srcdir" "$pkgdir/opt/$pkgname"
	ln -s "/opt/$pkgname/src/pathplanner" "$pkgdir/usr/bin/pathplanner" 
}
