# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname='xcursor-hackneyed'
pkgdesc='Cursor theme inspired by Windows 3.x with high-contrast and sensible use of colors'
pkgver='0.7.3'
pkgrel='1'
url='https://gitlab.com/Enthymeme/hackneyed-x11-cursors/'
license=('custom:MIT')
arch=('any')
makedepends=('make' 'xorg-xcursorgen' 'inkscape>=0.48.4' 'imagemagick>=6.8.6')
source=("${url}/-/archive/${pkgver}/hackneyed-x11-cursors-${pkgver}.tar.bz2")
sha512sums=('7a3aa96e520b30541907a228b239c194fcbd00ac2748e6e313921d6800628e9228ddeb3876a3b4bb162833efc10b8abedfdc5f1614a85b113783a882d1b337df')

build () {
	cd "hackneyed-x11-cursors-${pkgver}"
	make -j$(nproc) dist dist.left PREFIX=/usr
}

package () {
	cd "hackneyed-x11-cursors-${pkgver}"
	make install PREFIX=/usr DESTDIR="${pkgdir}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
