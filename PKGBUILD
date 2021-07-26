# Maintainer: Robin Boers <robindev2019@outlook.com>
pkgname=cutie-tanks
pkgver=1.4.3
pkgrel=1
pkgdesc="Shoot 'em all arcade game"
arch=(x86_64)
url="https://github.com/RobinBoers/cutie-tanks"
license=('GPL')
depends=(electron)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(cutie-tanks)
source=('git+https://github.com/RobinBoers/cutie-tanks#branch=bin'
		'sh' 
		'cutie-tanks.desktop'
		'icon.png')
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
	chmod +x "sh"
	mkdir -p "$pkgdir/opt/$pkgname/"
	mkdir -p "$pkgdir/usr/share/applications/"
	mkdir -p "$pkgdir/usr/bin/"
	
	mv cutie-tanks/* "$pkgdir/opt/cutie-tanks/"

	cp ./cutie-tanks.desktop "$pkgdir/usr/share/applications/cutie-tanks.desktop"
	cp ./sh "$pkgdir/usr/bin/cutie-tanks"
	cp ./icon.png "$pkgdir/opt/cutie-tanks/icon.png"
}