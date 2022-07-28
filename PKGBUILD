pkgname=rdo
pkgver=1.4.2
pkgrel=1
pkgdesc="A simple doas/sudo alternative."
arch=('any')
url=https://codeberg.org/sw1tchbl4d3/rdo
license=('GPL3')

source=(
"https://codeberg.org/sw1tchbl4d3/rdo/archive/${pkgver}.tar.gz"
)

sha512sums=(
"3dbf68728ca0463d358a9876d6d027d18a4f05de596f207f09882a585b06523000fde56bd08e028d2553172429d521bd7478dd8aee457f2e96e1ee76d0080bb4"
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
