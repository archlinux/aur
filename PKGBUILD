# Maintainer: Emil Renner Berthing <esmil@mailme.dk>
# Contributor: Elis Axelsson <etu@failar.nu>

_pkgname=stupidterm
pkgname=${_pkgname}-git
pkgver=v1.r4.g527c187
pkgrel=1
pkgdesc="A Stupid Terminal based on VTE"
arch=("i686" "x86_64" "armv5tel" "armv7l")
url="https://github.com/esmil/stupidterm"
license=("LGPL")
depends=("vte3")
source=("${_pkgname}::git+https://github.com/esmil/stupidterm.git")
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}"

    make clean
    make release
}

package() {
    cd "${_pkgname}"

    make DESTDIR="${pkgdir}" prefix=/usr install
}

# vim:set ts=2 sw=2 et:
