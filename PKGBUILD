# Last Packager: liolok <aur@liolok.com>
# Maintainer: Thanos Apostolou <thanosapostolou@outlook.com>

pkgname=gnome-shell-extension-custom-hot-corners
_pkgname=custom-hot-corners
pkgver=0.11
pkgrel=1
pkgdesc="A GNOME Shell Extension for customizable hot corners"
arch=('any')
url="https://github.com/janxyz/custom-hot-corners"
license=('GPL3')
depends=('gnome-shell')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('da66c64b85d7379c350db3ba00792286319b0becb021545b284369a6392e2bee')


build() {
    cd "${_pkgname}-$pkgver"
    autoreconf -vi
    ./configure --prefix=/usr
}

package() {
    cd "${_pkgname}-$pkgver"
    DESTDIR=${pkgdir} make install
}
