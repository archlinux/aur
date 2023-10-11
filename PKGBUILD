# Maintainer: mrHeavenli <mrHeavenli@icloud.com>

pkgname="rofi-playerctl-git"
pkgdesc="Control media players with a rofi menu"
url="https://github.com/mrHeavenli/rofi-playerctl"

pkgver=20231011
pkgrel=1

license=("GPL3")
depends=("rofi" "playerctl")
makedepends=("git")
arch=("any")
sha256sums=("SKIP")
source=("git+https://github.com/mrHeavenli/rofi-playerctl.git")
pkgver() {
		  cd "${srcdir}/rofi-playerctl"
		  git log -1 --format=%cd --date=short | tr -d '-'
}

package() {
	mkdir -p "${pkgdir}/usr/share"
	mkdir "${pkgdir}/usr/bin"

	chmod +x "${srcdir}/rofi-playerctl"
	cp -R "${srcdir}/rofi-playerctl" "${pkgdir}/usr/share"
	ln -s "/usr/share/rofi-playerctl/rofi-playerctl.sh" "${pkgdir}/usr/bin/rofi-playerctl"
}
