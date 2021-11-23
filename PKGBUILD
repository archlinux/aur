# Maintainer: Brett Lee (ItzAfroBoy) <me.caramackid@gmail.com>
pkgname=lst
pkgver=1.0.0
pkgrel=4
pkgdesc="A shitty file manager written in C99"
arch=('any')
url="https://github.com/ItzAfroBoy/lst"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
md5sums=('bd566d85601795e8ea8447f5952c0bd8')
depends=('txt')

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
