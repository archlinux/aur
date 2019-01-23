pkgname=genreport
pkgver=20190122
pkgrel=1
pkgdesc="Provides tools to check the DNS protocol compliance of the servers."
url=https://gitlab.isc.org/isc-projects/DNS-Compliance-Testing
license=('custom:Mozilla Public License v2.0')
arch=("x86_64")
makedepends=("gcc" "make" "autoconf")
conflicts=()
_commit="4e996109d6b54d61e0bafe76c40f186a4777a100"
source=("https://gitlab.isc.org/isc-projects/DNS-Compliance-Testing/-/archive/${_commit}/DNS-Compliance-Testing-${_commit}.tar.gz")
sha256sums=("88ce320c6e5a58377f278ef1f029372d0d9370aaebc4f24a8eec420453f1716b")

build() {
	pushd "${srcdir}/DNS-Compliance-Testing-${_commit}"
	autoreconf --install
	./configure --prefix=/usr
	make
	popd	
}

package() {
	pushd "${srcdir}/DNS-Compliance-Testing-${_commit}"
	make DESTDIR="${pkgdir}/" install
	popd
}
