# Maintainer: Nick Cao <nickcao@nichi.co>
pkgname=cleardns
pkgver=1.0.0
pkgrel=1
pkgdesc='another clean DNS'
arch=('x86_64')
license=('GPLv3')
makedepends=('go')
source=('cleardns.go'
	'cleardns.service')
md5sums=('77e84fb9011607c22532bb4e93dfee3c'
         'b8f005496cc95eaeb6e083f076253e9c')
build() {
	go build cleardns.go
}
package() {
	install -Dm744 $srcdir/cleardns $pkgdir/opt/cleardns
	install -Dm644 $srcdir/cleardns.service $pkgdir/usr/lib/systemd/system/cleardns.service
}
