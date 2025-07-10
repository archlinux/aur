pkgname="storyfork"
pkgver="1.1.0"
pkgrel="1"
pkgdesc="A tool for reading CYOA stories written in text files"
arch=("any")
url="https://codeberg.org/wayfarer/StoryFork"
license=("GPL-3.0-only")
groups=("wayfarer")
depends=("python-pyqt6" "python3")
source=("$url/archive/v$pkgver.zip")
sha512sums=("SKIP")

package() {
	mkdir -p "${pkgdir}/usr/share/mime/packages"
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/icons"
	mkdir -p "${pkgdir}/usr/share/doc/Wayfarer/StoryFork/Examples"

	install -Dm755 "${srcdir}/storyfork/src/storyfork.py" "${pkgdir}/usr/bin/storyfork"
	cp "${srcdir}/storyfork/build/mime-type.xml" "${pkgdir}/usr/share/mime/packages/wayfarer-storyfork.xml"
	cp "${srcdir}/storyfork/build/StoryFork.desktop" "${pkgdir}/usr/share/applications/StoryFork.desktop"
	cp "${srcdir}/storyfork/icons/storyfork-logo.png" "${pkgdir}/usr/share/icons/storyfork.png"

	cp "${srcdir}/storyfork/templates/Simple.gamebook" "${pkgdir}/usr/share/doc/Wayfarer/StoryFork/Examples/Simple.gamebook"
	cp "${srcdir}/storyfork/templates/Advanced.gamebook" "${pkgdir}/usr/share/doc/Wayfarer/StoryFork/Examples/Advanced.gamebook"
}