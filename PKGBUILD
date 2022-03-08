pkgname=rdo
pkgver=1.4
pkgrel=1
pkgdesc="A simple doas/sudo alternative."
arch=('x86_64' 'aarch64')
url=https://codeberg.org/sw1tchbl4d3/rdo
license=('GPL3')
depends=('libbsd')

source=(
"https://codeberg.org/sw1tchbl4d3/rdo/archive/${pkgver}.tar.gz"
)

sha512sums=(
"0f8251f0c85f0076b8e0a38ef0b6ac84f614b0629ee5778adcaa62728df2c704577b005541e39e76862e20a26986b150f8aa682761c5d32ccb1625d591ef8699"
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
