pkgname="fudebako-git"
pkgver=r24.ceaf576
pkgrel=1
pkgdesc="A GTK4 (GJS) based desktop shells"
arch=('any')
url="https://github.com/mcbeeringi/fudebako"
license=('MIT')
depends=('gtk4' 'gjs')
optdepends=('gtk4-layer-shell')
source=("git+https://github.com/mcbeeringi/fudebako.git")
conflicts=("fudebako")
provides=("fudebako")
sha256sums=('SKIP')

pkgver(){
	cd "fudebako"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package(){
	cd "${srcdir}/fudebako"
	install -Dm755 bin/* -t "${pkgdir}/usr/bin"
	install -Dm755 lib/fudebako/* -t "${pkgdir}/usr/lib/fudebako"
	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/fudebako"
}
