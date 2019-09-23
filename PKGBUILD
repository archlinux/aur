# Last Packager: liolok <aur@liolok.com>
# Maintainer: Thanos Apostolou <thanosapostolou@outlook.com>

pkgname=gnome-shell-extension-custom-hot-corners
_pkgname=custom-hot-corners
pkgver=0.4
pkgrel=1
pkgdesc="A GNOME Shell Extension for customizable hot corners"
arch=('any')
url="https://github.com/janxyz/custom-hot-corners"
license=('GPL3')
depends=('gnome-shell')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('97978dfc1620573fa9c24aa4081c51208e221f66b1539e74dc618ebc889ed3aa')


build() {
    cd "${_pkgname}-$pkgver"
    autoreconf -vi
    ./configure --prefix=/usr
}

package() {
    cd "${_pkgname}-$pkgver"
    DESTDIR=${pkgdir} make install
}
