# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname='xcursor-hackneyed'
pkgdesc='Cursor theme inspired by Windows 3.x with high-contrast and sensible use of colors'
pkgver='0.5.2'
pkgrel='1'
url='https://github.com/Enthymem/hackneyed-x11-cursors'
license=('custom:MIT')
arch=('any')
makedepends=('make' 'xorg-xcursorgen' 'inkscape>=0.48.4' 'imagemagick>=6.8.6')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('5dd05c860c5f7d2cf001b790db9a192e53532c89e35af6a458fd52b6e133ee17ee2a0e1dcb8c045b39c89117c05404be88864a3ebd4b0602c17ab1b64649ad1c')

build () {
	cd "hackneyed-x11-cursors-${pkgver}"
	make -j$(nproc) all lall PREFIX=/usr
}

package () {
	cd "hackneyed-x11-cursors-${pkgver}"
	make install PREFIX=/usr DESTDIR="${pkgdir}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
