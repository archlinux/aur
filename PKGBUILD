pkgname="storyfork"
pkgver="1.3.0"
pkgrel="1"
pkgdesc="A tool for reading CYOA stories written in text files"
arch=("x86_64")
url="https://codeberg.org/wayfarer/StoryFork"
license=("GPL-3.0-only")
groups=("wayfarer")
depends=("python-pyqt6" "python3")
source=("${pkgname}-${pkgver}.zip::${url}/archive/v${pkgver}.zip")
sha512sums=("a6c21748b0c69eeffb39ea8f96dedc2957eac129ca99bfe5e9227e0be364bcf2cc78aa4c72973fdc58f95f0864d32d67a74e53ff48ec4cb3bbed551d483b2d17")

package() {
	install -Dm755 "${srcdir}/storyfork/src/storyfork.py" "${pkgdir}/usr/bin/storyfork"

	install -Dm644 "${srcdir}/storyfork/build/StoryFork.desktop" "${pkgdir}/usr/share/applications/StoryFork.desktop"
	install -Dm644 "${srcdir}/storyfork/icons/storyfork-logo.png" "${pkgdir}/usr/share/icons/storyfork.png"
	install -Dm644 "${srcdir}/storyfork/conf/StoryFork.conf" "${pkgdir}/etc/StoryFork/StoryFork.conf"
	install -Dm644 "${srcdir}/storyfork/build/mime-type.xml" "${pkgdir}/usr/share/mime/packages/wayfarer-storyfork.xml"

	install -Dm644 "${srcdir}/storyfork/templates/Simple.gamebook" "${pkgdir}/usr/share/doc/StoryFork/Examples/Simple.gamebook"
	install -Dm644 "${srcdir}/storyfork/templates/Advanced.gamebook" "${pkgdir}/usr/share/doc/StoryFork/Examples/Advanced.gamebook"
}