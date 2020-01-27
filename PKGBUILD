# Maintainer: Artjom Simon <artjom.simon@gmail.com>
# Contributor: Orffen <orffen@orffenspace.com>
pkgname=otf-metropolis-git
pkgver=r9.r29.6c93f78
pkgrel=1
pkgdesc="The Metropolis font, a modern, geometric typeface."
arch=('any')
url="https://github.com/chrismsimpson/Metropolis"
license=('UNLICENSE')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=('otf-metropolis')
source=('git+https://github.com/chrismsimpson/Metropolis.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/Metropolis"
	printf "%s" "$(git describe --long --tags| sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	install -d "${pkgdir}/usr/share/fonts/OTF/"
	install -m644 Metropolis/Fonts/OpenType/Metropolis-*.otf "${pkgdir}/usr/share/fonts/OTF/"

	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m644 "Metropolis/UNLICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
