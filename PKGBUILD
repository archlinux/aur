# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=zafiro-icon-theme-git
pkgver=1.0.r12.g98dcf69
pkgrel=1
pkgdesc="Icon pack flat with light colors"
arch=('any')
url="https://github.com/zayronxio/Zafiro-icons"
license=('GPL3')
conflicts=('zafiro-icon-theme')
provides=('zafiro-icon-theme')
source=("${pkgname}::git+https://github.com/zayronxio/Zafiro-icons")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${srcdir}/${pkgname}"

	install -dm 755 "${pkgdir}/usr/share/icons"

	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	cp -a "${srcdir}/${pkgname}" "${pkgdir}/usr/share/icons/Zafiro"
}
