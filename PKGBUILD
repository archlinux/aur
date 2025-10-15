# Maintainer: Edinei Cavalcanti <hi@edinei.dev>
pkgname=oq-openapi-viewer-git
pkgver=40.c3bbc75
pkgrel=1
pkgdesc="Terminal OpenAPI Spec viewer"
arch=('x86_64')
url="https://github.com/plutov/oq"
license=('MIT')
depends=()
conflicts=('oq-openapi-viewer')
provides=('oq-openapi-viewer')
makedepends=('git' 'go')
source=("${pkgname}"::"git+https://github.com/plutov/oq")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "${srcdir}/${pkgname}"
	go build -o oq .
}

package() {
	cd "${srcdir}/${pkgname}"
  	install -Dm755 "oq" "$pkgdir/usr/bin/oq-openapi-viewer"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
