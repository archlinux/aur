# Maintainer: Kied Llaentenn <@kiedtl>
# Maintainer: ValleyKnight <valleyknight@protonmail.com>

pkgname=rsfetch-git
pkgver=2.0.0
pkgrel=1
pkgdesc="Fast (~5ms execution time) and somewhat(?) minimal fetch program written in Rust."
url="https://github.com/rsfetch/rsfetch"
license=('MIT')
depends=()
conflicts=('rsfetch-bin')
makedepends=("rust")
arch=("x86_64")
source=("rsfetch-git::git+https://github.com/rsfetch/rsfetch#branch=master")

build() {
	cd "${srcdir}/${pkgname}"
	make build
}

package() {
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}

	install -Dm 755 ${srcdir}/${pkgname}/target/release/rsfetch ${pkgdir}/usr/bin/rsfetch
	install -Dm 644 ${srcdir}/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('SKIP')
