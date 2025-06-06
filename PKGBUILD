# Maintainer: zacoons <zac [at] zacoons [dot] com>

pkgname=blocky-openrc
pkgver=1.0
pkgrel=1
pkgdesc="An OpenRC init script for the fast and lightweight DNS proxy as ad-blocker"
arch=("any")
url="https://github.com/0xERR0R/blocky"
license=("0BSD")
depends=(
	"openrc"
	"blocky"
)
source=(
	"blocky.initd"
	"LICENSE"
)
b2sums=(
	"955d7909f1ca1d023ee8e0a9958ce98f41831e6d3b9ba18d55dcd7511b3fc5b6ff2883e02347ddfcd9ba11b6b0dcc622a3851b382d072afaaa907be17781ff86" # blocky.initd
	"a29664104e1ee73ca0aee1d633e9095d92a57c92787f8d8740bdb7211ba3205782ed8677f539bdb8cae3dd75a3694be3132e185fa3fc4b3f401e1f88eb776101" # LICENSE
)

package() {
	install -D -v -m755 blocky.initd "$pkgdir/etc/init.d/blocky"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
