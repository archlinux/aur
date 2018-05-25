# Maintainer: zhs <zhao[TheDigitFour]she[TheDigitFourAgain]~AtSymbol~tutaDOTio>

pkgname=bdinfo-git
_pkgname=bdinfo
pkgver=r26.4b534fb
pkgrel=1
pkgdesc="Get bluray info and extract tracks including language metadata and chapters."
arch=('x86_64')
url="https://github.com/schnusch/bdinfo"
license=('LGPL3')
depends=('libbluray>=1.0.0')
optdepends=('ffmpeg: for remuxing')
makedepends=('git')
source=("git+https://github.com/schnusch/bdinfo.git")
md5sums=('SKIP')

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
	make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
