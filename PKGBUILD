# Maintainer: Michael Kuc <michaelkuc6 at gmail dot com>
# Contributor: Fabian Niepelt <Takios at github dot com>

_pkgname="download-with-kget"
pkgname="${_pkgname}-native-git"
pkgver=v0.2.r1.g21c7b6a
pkgrel=1
epoch=
pkgdesc="KGet extension native handler"
arch=('x86_64')
url="https://github.com/Takios/download-with-kget"
license=('MPL2')
groups=()
depends=(
	'git'
	'python-pydbus'
)
makedepends=()
checkdepends=()
optdepends=()
provides=("${_pkgname}")
conflicts=()
replaces=()
backup=()
options=()
changelog=
source=("git+https://github.com/Takios/download-with-kget"
	"Makefile.patch"
)
noextract=()
sha256sums=("SKIP"
			"af886b2595d917054933f8936f2c83f236ee4c56e4994eb5778cc9c51ccc7c05"
)

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	patch "${_pkgname}/src/native/Makefile" Makefile.patch
}

build() {
	:
}

check() {
	:
}

package() {
	cd "${_pkgname}/src/native"
	make DESTDIR="${pkgdir}/" install
}
