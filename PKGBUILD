# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=gofumpt
pkgver=0.3.0
pkgrel=1
pkgdesc="A stricter gofmt"
arch=('i686' 'x86_64')
url="https://github.com/mvdan/gofumpt"
license=('custom')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mvdan/gofumpt/archive/v${pkgver}.tar.gz")
sha512sums=('0623d885a4b4323ee68594927a750de493c8348f353be486acd89b5edd832c70f7dec81dd54741d47efa4d4a394ecedc9835f4a0425d0995df068765e7f62d7a')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	GO111MODULE=on go build -mod=readonly
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 -t "${pkgdir}/usr/bin" gofumpt
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE LICENSE.google
}
