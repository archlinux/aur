# Maintainer: Thanos Apostolou <thanosapostolou@outlook.com>

pkgname=gnome-shell-extension-custom-hot-corners
_pkgname=custom-hot-corners
pkgver=0.1
pkgrel=1
pkgdesc="A GNOME Shell Extension for customizable hot corners"
arch=('any')
url="https://github.com/janxyz/custom-hot-corners"
license=('GPL3')
depends=('gnome-shell')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('ff655548521bce858316939cc733f42f3dba969ab8c6aaf6e72afba0d6f22c1d')


build() {
	cd "${_pkgname}-$pkgver"
    autoreconf -vi
    ./configure --prefix=/usr
}

package() {
	cd "${_pkgname}-$pkgver"
	DESTDIR=${pkgdir} make install
}
