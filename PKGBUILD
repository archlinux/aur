# Maintainer: xezo360hye <xezo360hye@gmail.com>
# Contributor: nate-sys <?>
_pkgname="muc"
pkgname="${_pkgname}-git"
pkgver=r54.b15b06b
pkgrel=1
pkgdesc="Visualize your most used commands"
arch=('any')
url="https://github.com/nate-sys/muc"
license=('GPL3')
depends=('rust')
makedepends=('git')
provides=('muc')
source=("${_pkgname}::git+https://github.com/nate-sys/muc.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_pkgname}"
	cargo build --release
	install -Dm755 "target/release/${_pkgname}" -t "${pkgdir}/usr/bin"
}
