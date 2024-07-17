# Contributor: Simão Gomes Viana <devel@superboring.dev>

pkgname=srcry-git
pkgver=r43.ff343e2
pkgrel=1
pkgdesc="A simple but very fast recursive source code spell checker made in C"
arch=('x86_64')
url="https://github.com/Theldus/sourcery"
license=('MIT')
depends=('glibc')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "sourcery"
	printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
	cd "sourcery"
	make
}

package() {
	cd "sourcery"
	install -Dm755 "srcry" "${pkgdir}/usr/bin/srcry"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
