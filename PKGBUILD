pkgname="storyfork"
pkgver="1.1.0"
pkgrel="2"
pkgdesc="A tool for reading CYOA stories written in text files"
arch=("x86_64")
url="https://codeberg.org/wayfarer/StoryFork"
license=("GPL-3.0-only")
groups=("wayfarer")
depends=("python-pyqt6" "python3")
source=("${pkgname}-${pkgver}.zip::${url}/archive/v${pkgver}.zip")
sha512sums=("c05be823edde55ccd36f3546d674b05aefb6b314f76ad93ccad7886c7efe2f093f144783a8e5a0e460194324e8b20e5031081e75d7fc483df2d39825b6088b00")

package() {
	install -Dm755 "${srcdir}/storyfork/src/storyfork.py" "${pkgdir}/usr/bin/storyfork"

	install -Dm644 "${srcdir}/storyfork/build/StoryFork.desktop" "${pkgdir}/usr/share/applications/StoryFork.desktop"
	install -Dm644 "${srcdir}/storyfork/icons/storyfork-logo.png" "${pkgdir}/usr/share/icons/storyfork.png"
	install -Dm644 "${srcdir}/storyfork/build/mime-type.xml" "${pkgdir}/usr/share/mime/packages/wayfarer-storyfork.xml"

	install -Dm644 "${srcdir}/storyfork/templates/Simple.gamebook" "${pkgdir}/usr/share/doc/StoryFork/Examples/Simple.gamebook"
	install -Dm644 "${srcdir}/storyfork/templates/Advanced.gamebook" "${pkgdir}/usr/share/doc/StoryFork/Examples/Advanced.gamebook"
}