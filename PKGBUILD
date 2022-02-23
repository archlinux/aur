# Maintainer: Radeox <dawid.weglarz95@gmail.com>

pkgname=gnome-shell-extension-forge
_pkgname=forge
_gnomever=41
pkgver=41
pkgrel=1
pkgdesc="Tiling and Window Manager for Gnome-Shell"
arch=('any')
url="https://github.com/jmmaranan/forge"
license=('GPLv3')
depends=('gnome-shell')
makedepends=('intltool' 'gettext' 'git' 'sassc')
source=("https://github.com/jmmaranan/${_pkgname}/archive/refs/tags/v${_gnomever}-${pkgver}.tar.gz")
sha256sums=('985da153b83be04802033cbbf7f5416a7c5911b4b07ea390ee23a0eb7efd2592')

build() {
    cd ${srcdir}/${_pkgname}-${_gnomever}-${pkgver}/
    make
}

package() {
    cd ${srcdir}/${_pkgname}-${_gnomever}-${pkgver}/
    make DESTDIR="${pkgdir}" VERSION="${pkgver}" install
}
