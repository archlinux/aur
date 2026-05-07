# Maintainer: Hazel Atkinson <yellowsink@riseup.net>

pkgname=shelter
pkgver=0.0.2
pkgrel=1
pkgdesc="a flux interceptor with discord as a liability"
arch=('any')
url="https://github.com/uwu/shelter"
license=('CC0')
groups=()
depends=()
makedepends=()
source=("shelter-src::git+https://github.com/uwu/shelter" "install-shelter::https://github.com/uwu/shelter-installer/releases/download/v2.1.0/install-shelter")
sha256sums=(SKIP cc0e2e86c12c7f7b7e1b6553c7cf0dffb248e096a2cc64631faae64b208fbb92)

package() {
	# make dirs
	install -d "${pkgdir}"/usr/share/shelter
	install -d "${pkgdir}"/usr/share/libalpm/hooks

	# copy over scripts
	install -D shelter-src/injectors/linux-package-managers/scripts/* "${pkgdir}"/usr/share/shelter/

	# copy over hooks
	install -D shelter-src/injectors/linux-package-managers/arch-alpm-hooks/* "${pkgdir}"/usr/share/libalpm/hooks/

	# copy installer
	install -D install-shelter "${pkgdir}"/usr/bin/shelter-installer
}
