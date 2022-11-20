# Maintainer: Primalmotion <primalmotion at pm dot me>

pkgname=monocol-git
pkgdesc="Simple tool to generate monochromatic colorscheme for wpg"
url="https://git.sr.ht/~primalmotion/monocol"
pkgver=v1.0.0.r0.g9998d59
pkgrel=1
license=(GPL3)
arch=(any)
makedepends=(go )
source=("${pkgname}::git+${url}")
sha1sums=('SKIP')
provides=("monocol")
conflicts=("monocol")

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}"
	make monocol
}

package() {
	cd "${srcdir}/${pkgname}"
	PREFIX=${pkgdir}/usr make install
}
