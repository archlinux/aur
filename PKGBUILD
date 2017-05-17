# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=xf86-input-tslib
pkgver=1.0.0
pkgrel=1
pkgdesc='X.org tslib input driver'
arch=(arm i686 x86_64)
license=('custom:MIT')
url='https://github.com/merge/xf86-input-tslib'
depends=('glibc' 'tslib')
makedepends=('xorg-server-devel')
options=('!libtool')
groups=('xorg-drivers')
source=("https://github.com/merge/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('2e888893b766bb987ed4d788555dc221e3974068580ba782753a4a80532a42e7')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

