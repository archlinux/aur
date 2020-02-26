# Last Packager: liolok <aur@liolok.com>
# Maintainer: Thanos Apostolou <thanosapostolou@outlook.com>

pkgname=gnome-shell-extension-custom-hot-corners
_pkgname=custom-hot-corners
pkgver=0.7
pkgrel=1
pkgdesc="A GNOME Shell Extension for customizable hot corners"
arch=('any')
url="https://github.com/janxyz/custom-hot-corners"
license=('GPL3')
depends=('gnome-shell')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('00fbd5eb20c3d995f0ee4ac47d1653f2080b5d3dc869e57d89d30bf6d716cc30')


build() {
    cd "${_pkgname}-$pkgver"
    autoreconf -vi
    ./configure --prefix=/usr
}

package() {
    cd "${_pkgname}-$pkgver"
    DESTDIR=${pkgdir} make install
}
