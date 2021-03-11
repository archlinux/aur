# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=gofumpt
pkgver=0.1.1
pkgrel=1
pkgdesc="A stricter gofmt"
arch=('i686' 'x86_64')
url="https://github.com/mvdan/gofumpt"
license=('custom')
makedepends=('go')
source=("${pkgname}::https://github.com/mvdan/gofumpt/archive/v${pkgver}.tar.gz")
sha512sums=('11bb6ccfa0ecd8d8747b75b40253d7d82efb570a339d8d066d5757d53d4eb6e3c0d8bab04ffecd4635f2aafbe6aae83120d4bcace5409e61b29b40efe8510185')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	GO111MODULE=on go build -mod=readonly
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 -t "${pkgdir}/usr/bin" gofumpt
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE LICENSE.google
}
