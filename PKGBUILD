# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname='xcursor-hackneyed'
pkgdesc='Cursor theme inspired by Windows 3.x with high-contrast and sensible use of colors'
pkgver='0.7.2'
pkgrel='1'
url='https://gitlab.com/Enthymeme/hackneyed-x11-cursors/'
license=('custom:MIT')
arch=('any')
makedepends=('make' 'xorg-xcursorgen' 'inkscape>=0.48.4' 'imagemagick>=6.8.6')
source=("${url}/-/archive/${pkgver}/hackneyed-x11-cursors-${pkgver}.tar.bz2")
sha512sums=('9c7c77ac8ee527e22ee66baac3603fde2c634520c07eeb6b52787b69fdb0e41328ed62081046681b30a3ca9282019e52e4af80213a6316384140f84dbdc0fe9b')

build () {
	cd "hackneyed-x11-cursors-${pkgver}"
	make -j$(nproc) dist dist.left PREFIX=/usr
}

package () {
	cd "hackneyed-x11-cursors-${pkgver}"
	make install PREFIX=/usr DESTDIR="${pkgdir}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
