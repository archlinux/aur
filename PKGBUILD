# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=gofumpt
pkgver=0.3.1
pkgrel=1
pkgdesc="A stricter gofmt"
arch=('i686' 'x86_64')
url="https://github.com/mvdan/gofumpt"
license=('custom')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mvdan/gofumpt/archive/v${pkgver}.tar.gz")
sha512sums=('ca54bc7b58eb06e006c14da9ed9c31019fbde4880eff390b87374c2336b4721a7112e50fd0ffb8e59509abf006f0f736d85fd94a7824401419dde3f1d12c2114')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	GO111MODULE=on go build -mod=readonly
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 -t "${pkgdir}/usr/bin" gofumpt
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE LICENSE.google
}
