# Maintainer: Egor Vorontsov <sdoregor@gmail.com>

pkgname=ttf-ubuntu-mono-ligaturized-git
_pkgname=ubuntu-mono-ligaturized
pkgver=2.0.0.r1.gc9416cd
pkgrel=1
pkgdesc="Ubuntu Mono font with programming ligatures"
arch=(any)
url="https://github.com/datavis-tech/${_pkgname}"
license=(GPL)
makedepends=(git)
provides=(ttf-ubuntu-mono-ligaturized)
conflicts=(ttf-ubuntu-mono-ligaturized)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${_pkgname}"
	install -Dm644 *.ttf -t "${pkgdir}"/usr/share/fonts/TTF
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
