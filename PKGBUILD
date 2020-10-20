# Maintainer: Rustem B. <rustemb@systemli.org>

pkgname=zweistein
pkgver=0.0.5
pkgrel=1
pkgdesc="TUI reimplementation of the Eistein puzzle"
arch=(x86_64)
url="https://github.com/ANGulchenko/ZweiStein"
license=('GPL3')
depends=(ncurses glibc)
makedepends=(gcc cmake make)
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=('776e818c619934535606f78a98b2f9b8')

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
