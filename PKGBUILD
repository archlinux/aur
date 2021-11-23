# Maintainer: Brett Lee (ItzAfroBoy) <me.caramackid@gmail.com>
pkgname=txt
pkgver=1.0.0
pkgrel=2
pkgdesc="A shitty text editor written in C99"
arch=('any')
url="https://github.com/ItzAfroBoy/txt"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
md5sums=('811fd6c6987c46c1d92640eb6cbea33c')

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
