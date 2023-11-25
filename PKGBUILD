# Maintainer: Hoream <hoream@qq.com>
_pkgname="satty"
pkgname="${_pkgname}-git"
pkgver=0.7.0.r4.ge1ad952
pkgrel=1
pkgdesc="A screenshot annotation tool inspired by Swappy and Flameshot."
url="https://github.com/gabm/satty"
license=("MPL2")
arch=('x86_64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=("hicolor-icon-theme" "gcc-libs" "libadwaita" "glib2" "gdk-pixbuf2" "gtk4" "pango" "glibc" "cairo")
makedepends=("cargo" "git" "make")
source=(${_pkgname}::git+${url})
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

build(){
 	cd "${srcdir}/${_pkgname}"
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    PREFIX=${pkgdir}/usr make install
}
