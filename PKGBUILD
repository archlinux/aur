# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname='xcursor-hackneyed'
pkgdesc='Cursor theme inspired by Windows 3.x with high-contrast and sensible use of colors'
pkgver='0.6'
pkgrel='1'
url='https://gitlab.com/Enthymeme/hackneyed-x11-cursors/'
license=('custom:MIT')
arch=('any')
makedepends=('make' 'xorg-xcursorgen' 'inkscape>=0.48.4' 'imagemagick>=6.8.6')
source=("${url}/-/archive/${pkgver}/hackneyed-x11-cursors-${pkgver}.tar.bz2")
sha512sums=('e41667779c788b975a0083c274e776dac04d08bea33f80865242db49df44a6fa7337e8f36398752654cb4ce15fdb7f0716b59e714732c09adbf8a64bf5906d96')

build () {
	cd "hackneyed-x11-cursors-${pkgver}"
	make -j$(nproc) all all.left PREFIX=/usr
}

package () {
	cd "hackneyed-x11-cursors-${pkgver}"
	make install PREFIX=/usr DESTDIR="${pkgdir}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
