# Maintainer: system64 <system64fumo@protonmail.com>

pkgname=fumofetch-git
pkgver=2024.11.12
pkgrel=1
pkgdesc="FumoFumo?"
arch=('aarch64' 'riscv64' 'x86_64')
url="https://github.com/System64fumo/fumofetch"
license=('WTFPL')
makedepends=('git' 'gcc' 'make')
source=("git+https://github.com/System64fumo/fumofetch")
sha256sums=('SKIP')

pkgver() {
	cd "fumofetch"
	git show -s --format=%cd --date=format:%Y.%m.%d $(git rev-parse HEAD)
}

build() {
	cd "fumofetch"
	make
}

package() {
	cd "fumofetch"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
