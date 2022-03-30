# Maintainer: Josesk Volpe <joseskvolpe at gmail dot com>
pkgname=winegui
pkgver=1.5.2
pkgrel=1
pkgdesc="A user-friendly WINE graphical interface"
arch=('x86_64')
url="https://gitlab.melroy.org/melroy/winegui"
license=('AGPL3')
depends=(
	'gtkmm3'
	# 'cabextract'
	# 'unzip'
	# 'p7zip'
	# 'wget'
	# Some dependencies were uncommented as the official packages tells it depends on them, but namcap claims they aren't needed
)
optdepends=('wine')
source=("$pkgname-$pkgver.tar.gz::https://winegui.melroy.org/downloads/WineGUI-v$pkgver.tar.gz")
md5sums=('da49671f22cc2ffb350111fce9c0335d')

prepare(){
	chmod +x WineGUI-v$pkgver/share/applications/*
}

package() {
	mkdir $pkgdir/usr
	mv WineGUI-v$pkgver/* "$pkgdir/usr/"
}
