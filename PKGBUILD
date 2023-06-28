# Contributor: Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>

pkgname=texel
pkgver=1.08
pkgrel=1
pkgdesc="free UCI compliant open source chess engine developed by Peter Österlund"
arch=('i686' 'x86_64')
url="https://github.com/peterosterlund2/texel"
license=('GPL')
depends=('gcc-libs')
makedepends=(cmake)
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/peterosterlund2/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('2bd2a389ef447d91a11df8d03def12b6405c83c37a6462b5f4b4add60efeaf0a5c9e6ae831524b7af6f12a5fa38a439b6e903402d6453540988f9f55ed46c4a7')


build() {
	cmake -B build -S "$pkgname-$pkgver"
  cmake --build build
}

package() {
	install -Dm0755 build/$pkgname ${pkgdir}/usr/bin/$pkgname
}
