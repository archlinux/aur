
_pkgname=ti84cc
pkgname="${_pkgname}-git"
pkgver=r14.29f54c60e384e2008ad31f34f099156e368f659b
pkgrel=1
epoch=
pkgdesc='Compiler for ti84+.'
arch=(any)
url="https://github.com/kuche1/${_pkgname}.git"
liecnse=('ISC')
depends=()
makedepends=(git)
optdepends=()
provides=("${_pkgname}")
source=("git+$url")
md5sums=("SKIP")

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse HEAD)"
}

build() {
	cd "${_pkgname}"
	make -j
}

package() {
	cd "${_pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm644 README "${pkgdir}/usr/share/doc/${_pkgname}/README"
	mkdir -p "${pkgdir}/usr/bin/"
	cp tibasic "${pkgdir}/usr/bin/${_pkgname}"
}
