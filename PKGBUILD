# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: thaliarchos <thaliarchos at protonmail dot com>

pkgname=bookmenu-git
pkgver=r138.e8f8109
pkgrel=2
pkgdesc="Command line utility to browse and download ebooks from LibGen, using the InterPlanetary File System."
arch=('any')
url="https://github.com/kusky3/bookmenu"
license=('GPL3')
depends=('viu' 'wget')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/kusky3/bookmenu')
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"

	install -Dm755 "${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
