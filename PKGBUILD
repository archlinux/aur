pkgname=rdo
pkgver=1.4.1
pkgrel=1
pkgdesc="A simple doas/sudo alternative."
arch=('any')
url=https://codeberg.org/sw1tchbl4d3/rdo
license=('GPL3')

source=(
"https://codeberg.org/sw1tchbl4d3/rdo/archive/${pkgver}.tar.gz"
)

sha512sums=(
"2aeafa33366d461ef53a8f44dbb57756aa42e213a1e1cd9b36edf7358760db0f48d344215941ca9a2e56c2092dd665677d24dc3b895bfbd2a1244ef69dd2f0ae"
)

build() {
	cd $srcdir/rdo
	make
}

package() {
	cd $srcdir/rdo
	mkdir -p $pkgdir/etc
	mkdir -p $pkgdir/usr/bin
	install -oroot -Dm4755 rdo $pkgdir/usr/bin/rdo 
	install -oroot -Dm0600 rdo_sample.conf $pkgdir/etc/rdo.conf
}
