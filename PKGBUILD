# Contributor: Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>

pkgname=texel
pkgver=1.10
pkgrel=1
pkgdesc='Free UCI compliant open source chess engine developed by Peter Österlund'
arch=('i686' 'x86_64')
url='https://github.com/peterosterlund2/texel'
license=('GPL')
depends=('gcc-libs')
makedepends=(cmake)
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/peterosterlund2/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('28e7fdc64dfdb320d86844f73f2ac7a55ce8ce1e260c492ecfd854666cbdbfbc7b5d43c379b98fe693c47ee85f9b48953070a1f76dc4193f4250788876e95a10')


build() {
	cmake -B build -S "$pkgname-$pkgver"
	cmake --build build
}

package() {
	install -Dm0755 build/$pkgname ${pkgdir}/usr/bin/$pkgname
}
