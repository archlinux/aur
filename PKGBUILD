# Maintainer: David Goudou <david.goudou@gmail.com>
pkgname=coffeetch-git
pkgver=1.0.r2.7cea9b5
pkgrel=1
pkgdesc="Minimal command line system information tool written in C"
arch=('x86_64')
url="https://gitlab.com/gksudolol/coffeetch.git"
license=('MIT')
depends=('gcc')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
	cd coffeetch
	printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd coffeetch
	make
}

package() {
	cd coffeetch
	install -Dm755 coffeetch "${pkgdir}/usr/bin/coffeetch"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.org "${pkgdir}/usr/share/doc/${pkgname}/README.org"
}
