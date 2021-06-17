# Maintainer: Sematre <sematre at gmx dot de>
pkgname=eac3to
pkgver=3.34
pkgrel=1

pkgdesc="Audio/Video processing software with focus on new generation HD formats, Blu-ray and HD DVD."
arch=('x86_64')
url="https://forum.doom9.org/showthread.php?t=125966"
license=('custom')
depends=('wine')
source=("${pkgname}-${pkgver}.zip::http://madshi.net/eac3to.zip"
        "start-eac3to.sh")
sha256sums=('6538ea65d4dd31bce914bf0757ee421a590829582bec7de43710fc6b424ee07d'
            '4f432b56086214d16e38687db5fd077fddebd7c0e6586980e3b4df35a42021d0')

package() {
	# Install the executable
	install -Dm644 "eac3to.exe"      -t "${pkgdir}/usr/share/eac3to"
	install -Dm755 "start-eac3to.sh"    "${pkgdir}/usr/bin/eac3to"

	# Install the DLLs
	find . -name '*.dll' -exec install -Dm644 "{}" -t "${pkgdir}/usr/share/eac3to" \;

	# Install the sound files
	find . -name '*.wav' -exec install -Dm644 "{}" -t "${pkgdir}/usr/share/eac3to" \;

	# License
	install -Dm644 "license.txt"    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
