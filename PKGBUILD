_pkgname="raylib-cpp"
pkgname=${_pkgname}-git
pkgver=0.1.0.r38.g6649ff7
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="https://github.com/RobLoach/raylib-cpp"
license=('MIT')
depends=('raylib')
provides=("${_pkgname}")
conflicts=()
epoch=1
source=("${_pkgname}::git+https://github.com/RobLoach/raylib-cpp.git")

sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"
}

build() {
	cd "${srcdir}/${_pkgname}"
}

check() {
	cd "${srcdir}/${_pkgname}"
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -m644 -d "${pkgdir}/usr/include/raylib"
	cp -r "${srcdir}/${_pkgname}/include/raylib" "${pkgdir}/usr/include/"
	install -m644 -D "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -m644 -D "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
