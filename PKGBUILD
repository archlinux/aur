# Maintainer: Radeox <dawid.weglarz95@gmail.com>

pkgname=gnome-shell-extension-forge
_pkgname=forge
_gnomever=43
pkgver=56
pkgrel=1
pkgdesc="Tiling and Window Manager for Gnome-Shell"
arch=('any')
url="https://github.com/jmmaranan/forge"
license=('GPLv3')
depends=('gnome-shell')
makedepends=('intltool' 'gettext' 'git' 'sassc')
source=("https://github.com/jmmaranan/${_pkgname}/archive/refs/tags/v${_gnomever}-${pkgver}.tar.gz")
sha256sums=("03a4dec09f2c4eb0317bbd8f39b5da0be14a2df622f21379654040e868a38742")

build() {
    cd ${srcdir}/${_pkgname}-${_gnomever}-${pkgver}/
    make build
}

package() {
    cd ${srcdir}/${_pkgname}-${_gnomever}-${pkgver}/
    make DESTDIR="${pkgdir}" VERSION="${pkgver}" install
}
