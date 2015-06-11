# Maintainer: Malte Ohmstede <malte.ohmstede@gmail.com>

_pkgname=arc-theme
pkgname=arc-gtk-theme-git
pkgver=53.74f43ab
pkgrel=1
pkgdesc="Arc is a flat theme with transparent elements for GTK 3, GTK 2 and Gnome-Shell. It supports GTK 3 and GTK 2 based desktop environments like Gnome, Unity, Budgie, Pantheon, etc."
arch=('any')
url="https://github.com/horst3180/Arc-theme"
license=('GPL3')
depends=('gnome-themes-standard' 'gtk-engine-murrine')
makedepends=('git' 'automake' 'autoconf')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
replaces=("${_pkgname}")
options=(!strip)
source=(${pkgname}::"git+https://github.com/horst3180/${_pkgname}.git")
sha256sums=('SKIP')


pkgver() {
    cd ${srcdir}/${pkgname}
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}


build(){
    cd $srcdir/$pkgname
    ./autogen.sh --prefix=/usr

}
package() {
    cd $srcdir/$pkgname
    make DESTDIR="${pkgdir}" install
}
