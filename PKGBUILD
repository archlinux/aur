# Maintainer: Sung Mingi <FiestaLake@protonmail.com>

pkgname=gnome-shell-extension-custom-hot-corners-extended
_pkgname=custom-hot-corners-extended
pkgver=16
pkgrel=1
# _pkgrev=
pkgdesc="A GNOME Shell Extension that allows you to use corners and edges as triggers for various actions."
arch=('any')
url="https://github.com/G-dH/custom-hot-corners-extended"
_releaseurl="https://github.com/FiestaLake/custom-hot-corners-extended"
license=('GPL3')
depends=('gnome-shell')
provides=('gnome-shell-extension-custom-hot-corners-extended')
source=("${_releaseurl}/archive/Ext-v${pkgver}${_pkgrev}.tar.gz")
sha256sums=('8370d8c27b56d02e082d7b626237a3abe7cae56ff40a7d3329df3a2cedeaf1d2')


build() {
    cd "${_pkgname}-Ext-v${pkgver}${_pkgrev}"
    autoreconf -vi
    ./configure --prefix=/usr
}

package() {
    cd "${_pkgname}-Ext-v${pkgver}${_pkgrev}"
    DESTDIR=${pkgdir} make install
}
