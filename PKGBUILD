# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=gofumpt
pkgver=0.2.0
pkgrel=1
pkgdesc="A stricter gofmt"
arch=('i686' 'x86_64')
url="https://github.com/mvdan/gofumpt"
license=('custom')
makedepends=('go')
source=("${pkgname}::https://github.com/mvdan/gofumpt/archive/v${pkgver}.tar.gz")
sha512sums=('4bd5376b1a72cf7510c883657e17e9d7e33049cce7956cc3c4a3e5d0428c25f3c659d50359bae725d1b66530471b1b41ca8698bc46d74c58683a6edb5cd71afe')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	GO111MODULE=on go build -mod=readonly
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 -t "${pkgdir}/usr/bin" gofumpt
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE LICENSE.google
}
