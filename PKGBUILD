# Maintainer: planktonzp <ruizhipeng001@gmail.com>

_pkgname=rose-pine-btop
pkgname=${_pkgname}-git
pkgver=r9.c27e5d4
pkgrel=1
pkgdesc='Rosé Pine theme for btop'
arch=('any')
url='https://github.com/rose-pine/btop'
license=('MIT')
depends=('btop')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "${_pkgname}"
	install -Dm644 -t "${pkgdir}/usr/share/btop/themes" \
		rose-pine.theme \
		rose-pine-moon.theme \
		rose-pine-dawn.theme
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
