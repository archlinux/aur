# Maintainer: Sung Mingi <FiestaLake@protonmail.com>

pkgname=gnome-shell-extension-custom-hot-corners-extended
_pkgname=custom-hot-corners-extended
pkgver=15
pkgrel=1
_pkgrev=-fixed
pkgdesc="A GNOME Shell Extension that allows you to use corners and edges as triggers for various actions."
arch=('any')
url="https://github.com/G-dH/custom-hot-corners-extended"
license=('GPL3')
depends=('gnome-shell')
provides=('gnome-shell-extension-custom-hot-corners-extended')
source=("${url}/archive/Ext-v${pkgver}${_pkgrev}.tar.gz")
sha256sums=('d74ddc32a201522b7040e6156ee3ff86a41abb25675f02225f32f256651be15b')


build() {
    cd "${_pkgname}-Ext-v${pkgver}${_pkgrev}"
    autoreconf -vi
    ./configure --prefix=/usr
}

package() {
    cd "${_pkgname}-Ext-v${pkgver}${_pkgrev}"
    DESTDIR=${pkgdir} make install
}
