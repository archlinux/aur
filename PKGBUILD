# Maintainer: Randal <three-dim-sky@foxmail.com>
pkgname=dagtoc
pkgver=2.0.0
pkgrel=1
pkgdesc="A cli-tool for operating contents of pdf"
arch=('any')
url="https://github.com/TD-Sky/dagtoc"
license=('GPL3')
source=("$pkgname-$pkgver.tar.zst::https://github.com/TD-Sky/dagtoc/releases/download/v$pkgver/$pkgname-$pkgver.tar.zst")
sha256sums=('e463ae49ba1d95117b9401c8ee1d9258134f5c361f5425d156ce7243fb9ff0d7')

build() {
	cd "${pkgname}-${pkgver}"
	pip3 install pymupdf
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/dagtoc.py" -T "${pkgdir}/usr/bin/dagtoc"
}
