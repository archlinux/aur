# Maintainer: Batuhan Baserdem <lastn.firstn[at]gmail>
name=material-cursors
pkgname="${name}-git"
pkgver=20200505
pkgrel=1
pkgdesc="Material cursors with 3 color variant"
arch=("any")
url="https://github.com/varlesh/${name}"
license=("GPL")
makedepends=('inkscape' 'xorg-xcursorgen' 'git')
provides=("${name}")
conflicts=("${name}")
source=("git+${url}")
sha512sums=('SKIP')
pkgver() {
    cd "${srcdir}/${_srcname}"
    make dist
}
build() {
    cd "${srcdir}/${name}"
    make build
}
package() {
    cd "${srcdir}/${name}"
    make DESTDIR="${pkgdir}" install
}
