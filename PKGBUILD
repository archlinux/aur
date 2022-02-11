# Maintainer: Randal <three-dim-sky@foxmail.com>
pkgname=dagtoc
pkgver=2.0.0
pkgrel=2
pkgdesc="A cli-tool for operating contents of pdf"
arch=('any')
url="https://github.com/TD-Sky/dagtoc"
license=('GPL3')
source=("$pkgname-$pkgver.tar.zst::https://github.com/TD-Sky/dagtoc/releases/download/v$pkgver/$pkgname-$pkgver.tar.zst")
sha256sums=('31bbb8255c04d01ad172e35b401227c4101edcc107d1cd8808149e55b3291814')

build() {
	cd "${pkgname}-${pkgver}"
	pip3 install pymupdf
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/dagtoc.py" -T "${pkgdir}/usr/bin/dagtoc"
}
