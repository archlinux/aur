# Maintainer: Matt Mathis <aur@cloudninja.pw>
pkgname=glpaper
pkgver=1.0
pkgrel=1
epoch=()
pkgdesc="WLRoots based GLSL wallpapers for WLRoots compositors"
arch=('x86_64')
url="https://bitbucket.org/Scoopta/glpaper"
license=('GPL3')
groups=()
depends=('wayland')
makedepends=('egl-wayland' 'mercurial')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
validpgpkeys=()


prepare() {
	mkdir -p "${pkgname}-${pkgver}"
	hg clone ${url} "${pkgname}-${pkgver}"
}

build() {
	cd "${pkgname}-${pkgver}/Release"
        make
}

check() {
	echo "Checking"
}

package() {
	echo "Packaging"
	mkdir -p "../pkg/${pkgname}/usr/bin"
	cp ${pkgname}-${pkgver}/Release/glpaper "../pkg/${pkgname}/usr/bin/"
}
