# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=supercollider-headers-git
pkgver=r24987.f622b66b51
pkgrel=1
pkgdesc="SuperCollider headers used for building plugins"
arch=("any")
url="https://github.com/supercollider/supercollider"
license=('GPL')
groups=('pro-audio')
depends=()
makedepends=()
source=("supercollider-headers::git+https://github.com/supercollider/supercollider.git")
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "$srcdir/supercollider-headers"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "$srcdir/supercollider-headers"
	git submodule update --init --recursive
}


package() {
	install -dm755 "$srcdir/supercollider-headers" "${pkgdir}/usr/share/"
	cp -av "$srcdir/supercollider-headers" "${pkgdir}/usr/share/"
}
