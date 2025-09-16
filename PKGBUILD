pkgname="storyfork"
pkgver="1.2.0"
pkgrel="1"
pkgdesc="A tool for reading CYOA stories written in text files"
arch=("x86_64")
url="https://codeberg.org/wayfarer/StoryFork"
license=("GPL-3.0-only")
groups=("wayfarer")
depends=("python-pyqt6" "python3")
source=("${pkgname}-${pkgver}.zip::${url}/archive/v${pkgver}.zip")
sha512sums=("8d34a76e862cc91e253b83512667d26d9af6618557edc7eae117710dfa0de62f743a4c0f532b9a5565519ee591d3c3fcc9815a78ea533416a1fb65a8643870d8")

package() {
	install -Dm755 "${srcdir}/storyfork/src/storyfork.py" "${pkgdir}/usr/bin/storyfork"

	install -Dm644 "${srcdir}/storyfork/build/StoryFork.desktop" "${pkgdir}/usr/share/applications/StoryFork.desktop"
	install -Dm644 "${srcdir}/storyfork/icons/storyfork-logo.png" "${pkgdir}/usr/share/icons/storyfork.png"
	install -Dm644 "${srcdir}/storyfork/build/mime-type.xml" "${pkgdir}/usr/share/mime/packages/wayfarer-storyfork.xml"

	install -Dm644 "${srcdir}/storyfork/templates/Simple.gamebook" "${pkgdir}/usr/share/doc/StoryFork/Examples/Simple.gamebook"
	install -Dm644 "${srcdir}/storyfork/templates/Advanced.gamebook" "${pkgdir}/usr/share/doc/StoryFork/Examples/Advanced.gamebook"
}