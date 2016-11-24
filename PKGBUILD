# Maintainer: Lukas L <l.levickas@gmail.com>
pkgname=gotwitch
pkgver=1.0
pkgrel=1
pkgdesc="Simple Twitch.tv command-line app to watch and query streams"
arch=(any)
url="https://deluxo.github.io/gotwitch/"
_ghuser="https://github.com/deluxo/"
license=('GPL')
makedepends=('go')
optdepends=('mpv: for watching a livestream' 'vlc: for  watching a livestream')
install=
changelog=
source=("$pkgname::git+$_ghuser$pkgname.git")
md5sums=(SKIP)

build() {
	cd $pkgname
	go install gotwitch.go
	go build gotwitch.go
}

package() {
	cd $pkgname
	chmod +x gotwitch
	mkdir -p $pkgdir/usr/bin
	mv gotwitch $pkgdir/usr/bin/
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
