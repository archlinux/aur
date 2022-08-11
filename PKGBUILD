
_pkgname=minq-stopwatch
pkgname="${_pkgname}-git"
pkgver=r23.1bafe623da15f863411f7df3d79631e235716e38
pkgrel=1
epoch=
pkgdesc="A terminal based timer that remembers where you left off"
arch=(x86_64 i686)
url="https://github.com/kuche1/${_pkgname}.git"
license=('GPL')
groups=()
depends=(python python-art)
makedepends=(git python)
checkdepends=()
optdepends=()
provides=("${_pkgname}")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse HEAD)"
}

prepare() {
	cd "${_pkgname}"
}

build() {
	cd "${_pkgname}"
}

check() {
	cd "${_pkgname}"
	python3 --version
}

package() {
	cd "${_pkgname}"
	mkdir -p "${pkgdir}/opt/${pkgname}"
	cp -rf * "${pkgdir}/opt/${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s "/opt/${pkgname}/minq_stopwatch.py" "${pkgdir}/usr/bin/${_pkgname}"
}
