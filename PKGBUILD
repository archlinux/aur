# Maintainer: Matt Mathis <aur@cloudninja.pw>
pkgname=glpaper
pkgver=1.0
pkgrel=1
srcdir="src"
epoch=()
pkgdesc="WLRoots based GLSL wallpapers for WLRoots compositors"
arch=('x86_64')
url="https://bitbucket.org/Scoopta/glpaper"
license=('GPL3')
groups=()
depends=('wayland')
makedepends=('egl-wayland' 'mercurial')
source=("${pkgname}::hg+$url")
sha256sums=('SKIP')
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
pkgver() {
	mkdir -p ${srcdir}/${pkgver}
	cd ${srcdir}/${pkgname}
        echo $(hg identify -i)
}

build() {
	cd "${pkgname}/Release"
        make
}
package() {
	mkdir -p "../pkg/${pkgname}/usr/bin"
	cp ${pkgname}/Release/glpaper "../pkg/${pkgname}/usr/bin/"
}
