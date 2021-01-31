# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=gofumpt
pkgver=0.1.0
pkgrel=1
pkgdesc="A stricter gofmt"
arch=('i686' 'x86_64')
url="https://github.com/mvdan/gofumpt"
license=('custom')
makedepends=('go')
source=("${pkgname}::https://github.com/mvdan/gofumpt/archive/v${pkgver}.tar.gz")
sha512sums=('6d16a40c8155bfa971800f97babf087ab8b542e4dcd1bb2be815288c2fdc4a16d565c923fc65cd6c5becb315e67fac30b725bb1b06f41ba1a17e8953462ef8f6')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	GO111MODULE=on go build -mod=readonly
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 -t "${pkgdir}/usr/bin" gofumpt
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE LICENSE.google
}
