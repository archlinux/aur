# Maintainer: Julian Poidevin <poidevin dot julian at gmail dot com>
pkgname=rofi-adi1090x
pkgver=r74.60685ab
pkgrel=1
epoch=
pkgdesc="A huge collection of Rofi based custom Applets, Launchers & Powermenus."
arch=('any')
url="https://github.com/adi1090x/rofi"
license=(GPL3)
groups=()
depends=('rofi')
makedepends=(git)
optdepends=()
provides=('rofi-adi1090x')
conflicts=('rofi-adi1090x')
backup=('usr/share/sddm/themes/tokyo-night-sddm/theme.conf')
source=('git+https://github.com/adi1090x/rofi.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/rofi"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/rofi"
	chmod +x setup.sh
}

package() {
	cd "${srcdir}/rofi"
	./setup.sh
}
