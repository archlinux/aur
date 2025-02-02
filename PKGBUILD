# Maintainer: Integral <integral@member.fsf.org>
# Contributor: AMD Radeon Rin <NEKO_CHOCOLA@OUTLOOK.COM>

pkgname=plymouth-theme-nekopara-chocola-git
_pkgname=${pkgname%-git}
pkgver=r2.9f19c0c
pkgrel=1
pkgdesc="Plymouth theme for Chocola Boot animation, NEKOPARA"
arch=('any')
url="https://github.com/Chocola-X/${_pkgname}"
license=('LicenseRef')
depends=('plymouth')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}/"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "${_pkgname}/"
	install -Dm644 chocola.plymouth -t "${pkgdir}/usr/share/plymouth/themes/chocola/"
	cp -r images "${pkgdir}/usr/share/plymouth/themes/chocola/"
}
