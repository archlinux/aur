# Maintainer: Julian Poidevin <poidevin dot julian at gmail dot com>
pkgname=sddm-theme-tokyo-night
pkgver=r3.ee611c2
pkgrel=1
epoch=
pkgdesc="A Tokyo Night theme for the SDDM Login Manager"
arch=('any')
url="https://github.com/rototrash/tokyo-night-sddm"
license=(LGPL2 GPL3)
groups=()
depends=('sddm')
makedepends=(git)
optdepends=()
provides=('sddm-theme-tokyo-night')
conflicts=('sddm-theme-tokyo-night')
backup=('usr/share/sddm/themes/tokyo-night-sddm/theme.conf')
source=('git+https://github.com/rototrash/tokyo-night-sddm')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/tokyo-night-sddm"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/share/sddm/themes/tokyo-night-sddm/"
	cp -r tokyo-night-sddm/ "${pkgdir}/usr/share/sddm/themes/"
}
