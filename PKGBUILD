# Maintainer: Matt Mathis <aur@cloudninja.pw>
pkgname=glpaper-hg
pkgver=r16.2b3a7b552353
pkgrel=1
pkgdesc="WLRoots based GLSL wallpapers for WLRoots compositors"
arch=('x86_64')
url="https://hg.sr.ht/~scoopta/glpaper"
license=('GPL3')
groups=()
depends=('wayland')
makedepends=('mercurial' 'meson')
source=("${pkgname}::hg+$url")
sha256sums=('SKIP')
pkgver() {
	cd "$pkgname"
        printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
	cd "${pkgname}"
        meson build
	ninja -C build
}
package() {
	mkdir -p "$pkgdir/usr/bin"
	cp ${pkgname}/build/glpaper "$pkgdir/usr/bin/"
}
