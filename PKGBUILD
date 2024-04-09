# Maintainer: gcmalloc <gcmalloc@gmail.com>

pkgname=openrdap-client
pkgver=0.9.1
pkgrel=1
pkgdesc="OpenRDAP is an command line RDAP client implementation in Go."
url="https://www.openrdap.org/"
arch=("x86_64")
license=("MIT")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/openrdap/rdap/archive/v$pkgver.tar.gz")
sha256sums=("06a330a9e7d87d89274a0bcedc5852b9f6a4df81baec438fdb6156f49068996d")

build() {
	cd rdap-${pkgver}/cmd/rdap
	go build
}

package() {
	cd rdap-${pkgver}
	install -Dm756 cmd/rdap/rdap "$pkgdir/usr/bin/${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
