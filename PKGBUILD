# Maintainer: Simão Gomes Viana <devel@superboring.dev>
pkgname=srcry-git
pkgver=master
pkgrel=1
_srcver=master
pkgdesc="A simple but very fast recursive source code spell checker made in C"
arch=('x86_64')
url="https://github.com/Theldus/sourcery"
license=('MIT')
groups=()
depends=()
makedepends=('make' 'clang' 'llvm' 'lld')
source=("git://github.com/Theldus/sourcery")
sha256sums=('SKIP')

prepare() {
	:
}

build() {
	cd "${srcdir}/sourcery"
	CC="clang" LD="clang" make -j$(nproc --all)
}

check() {
	:
}

package() {
	cd "${srcdir}/sourcery"
	install -Dm755 "${srcdir}/sourcery/srcry" "${pkgdir}/usr/bin/srcry"
}

