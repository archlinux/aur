# Maintainer: Primalmotion <primalmotion at pm dot me>

pkgname=monocol
pkgdesc="Simple tool to generate monochromatic colorscheme for wpg"
url="https://codeberg.org/primalmotion/monocol"
pkgver=v1.0.0
pkgrel=1
license=(GPL3)
arch=(any)
makedepends=(go)
source=("https://codeberg.org/primalmotion/monocol/archive/${pkgver}.tar.gz")
sha256sums=('889a700c3d0122f4a00c3ff4d881bd1e2eaf64b40e5512636ea5f6f0dacc71f3')
provides=("monocol")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make monocol
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	PREFIX=${pkgdir}/usr make install
}
