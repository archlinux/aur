# Maintainer: Rustem B. <rustemb@systemli.org>

pkgname=zweistein
pkgver=0.0.4
pkgrel=1
pkgdesc="TUI reimplementation of the Eistein puzzle"
arch=(x86_64)
url="https://github.com/ANGulchenko/ZweiStein"
license=('GPL3')
depends=(ncurses glibc)
makedepends=(gcc cmake make)
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=('5d107458e0a75279ccf280a6c6c8ac48')

build() {
	cd "ZweiStein-$pkgver"
	cmake ./
	make
}

package() {
	cd "ZweiStein-$pkgver"
        install -Dm755 ZweiStein   -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE     -t "$pkgdir/usr/share/licenses/$pkgname/"
}
