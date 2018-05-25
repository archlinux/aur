# Maintainer: Michael Kuc <michaelkuc6 at gmail dot com>
# Contributor: Fabian Niepelt <Takios at github dot com>

pkgname=download-with-kget-native-git
pkgver=0.3
pkgrel=1
epoch=
pkgdesc="KGet extension native handler"
arch=('x86_64')
url="https://github.com/Takios/download-with-kget"
license=('MPL2')
groups=()
depends=('git')
makedepends=()
checkdepends=()
optdepends=()
provides=('download-with-kget')
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

prepare() {
	patch download-with-kget/src/native/Makefile Makefile.patch
}

build() {
	:
}

check() {
	:
}

package() {
	cd "$srcdir/download-with-kget/src/native"
	make DESTDIR="${pkgdir}/" install
}
