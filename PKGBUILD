# Maintainer: Brett Lee (ItzAfroBoy) <me.caramackid@gmail.com>
pkgname=txt
pkgver=1.0.0
pkgrel=1
pkgdesc="A shitty text editor written in C99"
arch=('any')
url="https://github.com/ItzAfroBoy/txt.git"
license=('GPL3')
source=("git+$url")
md5sums=('SKIP')

build() {
	cd "${pkgname}"
	make
}

package() {
	cd "${pkgname}"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	mkdir -p "${pkgdir}/usr/bin"
	make BIN="${pkgdir}/usr/bin" install
}
