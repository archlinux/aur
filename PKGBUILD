# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=xf86-input-tslib
pkgver=0.0.7
pkgrel=1
pkgdesc='X.org tslib input driver'
arch=(arm i686 x86_64)
license=('custom:MIT')
url='http://xorg.freedesktop.org/'
depends=('glibc' 'tslib')
makedepends=('xorg-server-devel')
options=('!libtool')
groups=('xorg-drivers')
source=("https://github.com/merge/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('6f23cc9702b0ae16086d364b275335c094efbf6acde57f8a030e4db5b9aece03')

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

