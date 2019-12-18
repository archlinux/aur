# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=emerald-icon-theme-git
pkgver=2018.02.02.r18.ge2d3520
pkgrel=2
pkgdesc="Fresh and simple personality icon theme"
arch=('any')
url="https://github.com/vinceliuice/emerald-icon-theme"
license=('Custom')
conflicts=('emerald-icon-theme')
provides=('emerald-icon-theme')
source=("${pkgname}::git+https://github.com/vinceliuice/emerald-icon-theme")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${srcdir}/${pkgname}"

	install -dm 755 "${pkgdir}/usr/share/icons"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	cp -a "${srcdir}/${pkgname}/Emerald" "${pkgdir}/usr/share/icons/Emerald"
}
