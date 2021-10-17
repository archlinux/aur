# Maintainer: Sung Mingi <FiestaLake@protonmail.com>

pkgname=gnome-shell-extension-custom-hot-corners-extended
_pkgname=custom-hot-corners-extended
pkgver=9
pkgrel=1
pkgdesc="A GNOME Shell Extension that allows you to use corners and edges as triggers for various actions."
arch=('any')
url="https://github.com/G-dH/custom-hot-corners-extended"
license=('GPL3')
depends=('gnome-shell')
source=("${url}/archive/Ext-v${pkgver}.tar.gz")
sha256sums=('1f6e84b6c52546664a0ca093fe1b523f9e9cfdf05bb6de978c4d0e53f6cefab6')


build() {
    cd "${_pkgname}-Ext-v${pkgver}"
    autoreconf -vi
    ./configure --prefix=/usr
}

package() {
    cd "${_pkgname}-Ext-v${pkgver}"
    DESTDIR=${pkgdir} make install
}
