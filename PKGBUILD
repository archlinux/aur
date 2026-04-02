# Maintainer: Fermín Olaiz <ferminolaiz@gmail.com>

pkgname=mainsail-config-git
pkgver=r26.ff3869a
pkgrel=1
pkgdesc="Mainsail klipper macros and settings"
arch=(any)
url="https://github.com/mainsail-crew/mainsail-config"
license=('GPL-3.0-only')
depends=()
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git#branch=master")
sha256sums=(SKIP)

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "${srcdir}/${pkgname}"
	install -Dm644 -t "${pkgdir}/usr/share/mainsail-config/" *.{conf,cfg}
}
