# Last Packager: liolok <aur@liolok.com>
# Maintainer: Thanos Apostolou <thanosapostolou@outlook.com>

pkgname=gnome-shell-extension-custom-hot-corners
_pkgname=custom-hot-corners
pkgver=0.8
pkgrel=1
pkgdesc="A GNOME Shell Extension for customizable hot corners"
arch=('any')
url="https://github.com/janxyz/custom-hot-corners"
license=('GPL3')
depends=('gnome-shell')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('53eff790dc5bc631714b018bd2a13cb83fa307a851dd6ea30df81c0e424cc9f1')


build() {
    cd "${_pkgname}-$pkgver"
    autoreconf -vi
    ./configure --prefix=/usr
}

package() {
    cd "${_pkgname}-$pkgver"
    DESTDIR=${pkgdir} make install
}
