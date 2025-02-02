# Maintainer: Integral <integral@member.fsf.org>
# Contributor: AMD Radeon Rin <NEKO_CHOCOLA@OUTLOOK.COM>

pkgname=nekopara-welcome-screen-kde-git
_pkgname=${pkgname%-git}
pkgver=r12.95ed7c6
pkgrel=1
pkgdesc="Nekopara Welcome Screen for KDE"
arch=('any')
url="https://github.com/Chocola-X/${_pkgname}"
license=('LicenseRef')
depends=('plasma-workspace')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}/"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	install -d "${pkgdir}/usr/share/plasma/look-and-feel/"
	cp -r "${_pkgname}/uk.nekopara.welcome-screen.desktop" "${pkgdir}/usr/share/plasma/look-and-feel/"
}
