# Contributor: Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>

pkgname=texel
pkgver=1.12
pkgrel=2
pkgdesc='Free UCI compliant open source chess engine developed by Peter Österlund'
arch=('i686' 'x86_64')
url='https://github.com/peterosterlund2/texel'
license=('GPL')
depends=('gcc-libs')
makedepends=(cmake)
options=(!lto)
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/peterosterlund2/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('8421732332fca4315e854ed9e01fda3980f4517c3783d48231bede5e0403ca3b0b79fdb1edf1123a8730eadd845aa2c6ebee2d628b407c4d52ed5295b8e846a0')


build() {
	cmake -B build -S "$pkgname-$pkgver"
	cmake --build build
}

package() {
	install -Dm0755 build/$pkgname ${pkgdir}/usr/bin/$pkgname
}
