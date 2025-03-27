_pkgname="fudebako"
pkgname="${_pkgname}-git"
pkgver=0.0.1
pkgrel=1
pkgdesc="A GTK4 (GJS) based desktop shells"
arch=('any')
url="https://github.com/mcbeeringi/fudebako"
license=('MIT')
depends=('gtk4' 'gjs')
optdepends=('gtk4-layer-shell')
source=("${_pkgname}::git+https://github.com/mcbeeringi/fudebako.git")
conflicts=("${_pkgname}")
provides=(fudebako)
sha256sums=('SKIP')

pkgver(){
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package(){
	cd "${srcdir}/${_pkgname}"
	install -Dm755 "fdbk-menu" -t "${pkgdir}/usr/bin"
	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
