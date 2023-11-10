# Maintainer: setrofim <setrofim@gmail.com>
pkgname=qcbor-git
pkgver=v1.2
pkgrel=1
pkgdesc="A powerful, commercial-quality CBOR encoder/decoder"
arch=('x86_64')
url="https://github.com/laurencelundblade/QCBOR"
license=('BSD-3-clause')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
replaces=()
backup=()
options=('staticlibs')
install=
source=("${pkgname%-*}::git+https://github.com/laurencelundblade/QCBOR.git#tag=v1.2")
noextract=()
md5sums=('SKIP')

build() {
	cd "$srcdir/${pkgname%-*}"
	make
}

check() {
	cd "$srcdir/${pkgname%-*}"
	./qcbortest
}

package() {
	cd "$srcdir/${pkgname%-*}"
	make DESTDIR="$pkgdir/" install install_so
}
