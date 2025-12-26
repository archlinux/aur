pkgname="storyfork"
pkgver="2.0.0"
pkgrel="1"
pkgdesc="A tool for reading CYOA stories written in text files"
arch=("x86_64")
url="https://codeberg.org/wayfarer/StoryFork"
license=("GPL-3.0-only")
groups=("wayfarer")
depends=("python-pyqt6" "python3")
source=("${pkgname}-${pkgver}.zip::${url}/archive/v${pkgver}.zip")
sha512sums=("0670848116742d9e57ad26ba7b9ec2eccc219498a9420c644e62c40e514e31d9a2b1f7619df5e0b48e9994d1e5908b59a045718eeb7009542f66b584e63eb943")

package() {
	install -Dm755 "${srcdir}/storyfork/src/storyfork.py" "${pkgdir}/usr/bin/storyfork"

	install -Dm644 "${srcdir}/storyfork/build/StoryFork.desktop" "${pkgdir}/usr/share/applications/StoryFork.desktop"
	install -Dm644 "${srcdir}/storyfork/icons/storyfork-logo.png" "${pkgdir}/usr/share/icons/storyfork.png"
	install -Dm644 "${srcdir}/storyfork/conf/StoryFork.conf" "${pkgdir}/etc/StoryFork/StoryFork.conf"
	install -Dm644 "${srcdir}/storyfork/build/mime-type.xml" "${pkgdir}/usr/share/mime/packages/wayfarer-storyfork.xml"

	install -Dm644 "${srcdir}/storyfork/doc/Documentation.gamebook" "${pkgdir}/usr/share/doc/StoryFork/Documentation.gamebook"
}