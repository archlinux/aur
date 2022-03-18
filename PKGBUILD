# Maintainer: Sung Mingi <FiestaLake@protonmail.com>

pkgname=gnome-shell-extension-custom-hot-corners-extended-git
_pkgname=custom-hot-corners-extended
pkgver=15.fixed.r14.g2adc099
pkgrel=1
pkgdesc="A GNOME Shell Extension that allows you to use corners and edges as triggers for various actions - git"
arch=('any')
url="https://github.com/G-dH/custom-hot-corners-extended"
license=('GPL3')
depends=('gnome-shell')
provides=('gnome-shell-extension-custom-hot-corners-extended')
conflicts=('gnome-shell-extension-custom-hot-corners-extended')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')


pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/[^-]*-g/r&/;s/Ext.v*//;s/-/./g'
}

build() {
    cd "${_pkgname}"
    autoreconf -vi
    ./configure --prefix=/usr
}

package() {
    cd "${_pkgname}"
    DESTDIR=${pkgdir} make install
}
