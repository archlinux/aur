
# Maintainer: Emily "(emmowo)" <emmowo@noreply.codeberg.org>
pkgname=mly
pkgver=0.0.8
pkgrel=1
epoch=0
pkgdesc="A tiny, feature-filled programmer's editor!"
arch=(any)
url="https://codeberg.org/emmowo/mly"
license=('ISC')
depends=('ncurses')
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/emmowo/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('06417becaff17a81bf1fd0b461fb1f2e8ac2dbeee392b114b46165964d9abee4')

prepare() {
	cd "${pkgname}"
}

build() {
	cd "${pkgname}"
	make release
}

check() {
	cd "${pkgname}"
}

package() {
	cd "${pkgname}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	make DESTDIR="$pkgdir/usr/" install
}
