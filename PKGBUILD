# Maintainer: Radeox <dawid.weglarz95@gmail.com>

pkgname=gnome-shell-extension-forge
_pkgname=forge
_gnomever=43
pkgver=58
pkgrel=1
pkgdesc="Tiling and Window Manager for Gnome-Shell"
arch=('any')
url="https://github.com/jmmaranan/forge"
license=('GPLv3')
depends=('gnome-shell')
makedepends=('intltool' 'gettext' 'git' 'sassc')
source=("https://github.com/jmmaranan/${_pkgname}/archive/refs/tags/v${_gnomever}-${pkgver}.tar.gz")
sha256sums=("1938f1264f9eb389c8d1b6ab47386c143296fb0141e3fb7e97ecb0dfce96c788")

build() {
    cd ${srcdir}/${_pkgname}-${_gnomever}-${pkgver}/
    make build
}

package() {
    cd ${srcdir}/${_pkgname}-${_gnomever}-${pkgver}/
    make DESTDIR="${pkgdir}" VERSION="${pkgver}" install
}
