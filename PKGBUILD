# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=babel-tool
pkgver=0.7a
pkgrel=1
pkgdesc="Treaty of Babel Interactive Fiction analysis tool"
arch=('x86_64')
url="https://github.com/iftechfoundation/babel-tool"
license=('CC-BY-4.0')
provides=('babel')
conflicts=('babel-tool-git')
replaces=('ifbabel')
source=("https://github.com/iftechfoundation/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz" "https://babel.ifarchive.org/babel.md")
sha256sums=('132aa81e0bea1a4568404eb06807c9c8c309fb6a3aea91047463b99d3b9a736c' '0cd003474dbb21eaa218948606ff9beed7328571779b7ac22331a81d48f41ae4')

build() {
	cd "$pkgname-$pkgver"
	make "babel"
}

check() {
	cd "$pkgname-$pkgver"
	make "test"
}

package() {
	cd "$pkgname-$pkgver"

	#program
	install -Dm755 "babel" "${pkgdir}/usr/bin/babel"

	#docs
	install -Dm755 "../babel.md" "${pkgdir}/usr/share/doc/babel-tool/treaty-of-babel.md"
	install -Dm755 "README.md" "${pkgdir}/usr/share/doc/babel-tool/README.md"

}
