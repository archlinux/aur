# Maintainer: 404DeadLink <>

pkgname=otf-riemann-git
_pkgname=Riemann
pkgver=r1.4f85304
pkgrel=1
pkgdesc="An OpenType font for Functional Analysis of music"
url="https://github.com/mmeyn/Riemann"
makedepends=('fontforge' 'git')
license=('OFL')
source=('git://github.com/mmeyn/Riemann')
sha256sums=('SKIP')
arch=('any')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm644 -t "${pkgdir}/usr/share/fonts/OTF/" Riemann.otf
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE.md
}
