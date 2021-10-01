# Maintainer: Randal <three-dim-sky@foxmail.com>
pkgname=dagtoc
pkgver=1.0.0
pkgrel=1
pkgdesc="A cli-tool for operating TOC of pdf"
arch=('any')
url="https://github.com/TD-Sky/dagtoc"
license=('GPL3')
depends=('python-pip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TD-Sky/dagtoc/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('bf31a37275f2d47c3b8a03856e6da8907c390f713c4e4f4009f87e9701bca4ff')

build() {
	cd "${pkgname}-${pkgver}"
	pip install pymupdf
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/dagtoc.py" -T "${pkgdir}/usr/bin/dagtoc"
}
