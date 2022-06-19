# Maintainer: Radeox <dawid.weglarz95@gmail.com>

pkgname=gnome-shell-extension-forge
_pkgname=forge
_gnomever=42
pkgver=49
pkgrel=1
pkgdesc="Tiling and Window Manager for Gnome-Shell"
arch=('any')
url="https://github.com/jmmaranan/forge"
license=('GPLv3')
depends=('gnome-shell')
makedepends=('intltool' 'gettext' 'git' 'sassc')
source=("https://github.com/jmmaranan/${_pkgname}/archive/refs/tags/v${_gnomever}-${pkgver}.tar.gz")
sha256sums=('a8019df838904d9d0b47e7da6339b48fe8dd5b61c6a003df53d11153deea8037')

build() {
    cd ${srcdir}/${_pkgname}-${_gnomever}-${pkgver}/
    make build
}

package() {
    cd ${srcdir}/${_pkgname}-${_gnomever}-${pkgver}/
    make DESTDIR="${pkgdir}" VERSION="${pkgver}" install
}
