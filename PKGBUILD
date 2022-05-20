# Maintainer: atemmel <temmeladam@gmail.com>
pkgname=spider
pkgver=1.0
pkgrel=1
pkgdesc="Fast and simple terminal file manager"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/atemmel/${pkgname}"
license=('MIT')
depends=(
	'ncurses'
	'zig'
)
makedepends=('git')
source=("git+${url}")
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}"
	zig build -Drelease-fast
}

package() {
	cd "${srcdir}/${pkgname}"
	install -D -m755 zig-out/bin/$pkgname "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
