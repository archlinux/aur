_pkgname=gsp
pkgname=$_pkgname-git
pkgver=3.1.0
pkgrel=2
pkgdesc=" Better HTML syntax"
url="https://git.sr.ht/~mango/gsp"
arch=(x86_64)
license=(0BSD)
makedepends=(go git)
provides=(gsp)
conflicts=(gsp)
source=("git+$url#tag=v$pkgver")
b2sums=("SKIP")

build() {
	cd $_pkgname
	go build
}

package() {
	cd $_pkgname
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
	install -Dm644 $_pkgname.1 -t "$pkgdir/usr/share/man/man1/"
	install -Dm644 $_pkgname.5 -t "$pkgdir/usr/share/man/man5/"
	install -Dm755 $_pkgname -t "$pkgdir/usr/bin/"
}
