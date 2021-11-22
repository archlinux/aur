# Maintainer: Sung Mingi <FiestaLake@protonmail.com>

pkgname=gnome-shell-extension-custom-hot-corners-extended
_pkgname=custom-hot-corners-extended
pkgver=11
pkgrel=1
pkgdesc="A GNOME Shell Extension that allows you to use corners and edges as triggers for various actions."
arch=('any')
url="https://github.com/G-dH/custom-hot-corners-extended"
license=('GPL3')
depends=('gnome-shell')
source=("${url}/archive/Ext-v${pkgver}.tar.gz")
sha256sums=('a5f7c9086978baeffd2329907d9608eb4b114d6953a53b56bed407e372abeb15')


build() {
    cd "${_pkgname}-Ext-v${pkgver}"
    autoreconf -vi
    ./configure --prefix=/usr
}

package() {
    cd "${_pkgname}-Ext-v${pkgver}"
    DESTDIR=${pkgdir} make install
}
