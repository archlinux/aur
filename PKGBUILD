# Maintainer: Cain Atkinson <yellowsink@riseup.net>

pkgname=shelter
pkgver=0.0.1
pkgrel=2
pkgdesc="a flux interceptor with discord as a liability"
arch=('any')
url="https://github.com/uwu/shelter"
license=('CC0')
groups=()
depends=()
makedepends=()
source=("shelter-src::git+https://github.com/uwu/shelter")
sha256sums=("SKIP")

package() {
	# make dirs
	install -d "${pkgdir}"/usr/share/shelter/app
	install -d "${pkgdir}"/usr/share/libalpm/hooks

	# copy over scripts
	install -D shelter-src/injectors/linux-package-managers/scripts/* "${pkgdir}"/usr/share/shelter/

	# copy over hooks
	install -D shelter-src/injectors/linux-package-managers/arch-alpm-hooks/* "${pkgdir}"/usr/share/libalpm/hooks/

	# copy over shelter injector
	install -D shelter-src/injectors/desktop/app/* "${pkgdir}"/usr/share/shelter/app/
}
