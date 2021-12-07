pkgname=cfetch
pkgver=1.0.0
pkgrel=1
pkgdesc="A shitty fetch written in C99"
arch=('any')
url="https://github.com/ItzAfroBoy/cfetch"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
md5sums=('4e97c99a6ee8c840c3833fd52655b37b')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	mkdir -p "${pkgdir}/usr/bin"
	make BIN="${pkgdir}/usr/bin" install
}
