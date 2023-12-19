# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

pkgname=sham
pkgver=3.0.0
pkgrel=1
epoch=
pkgdesc="shell script compiler"
arch=(x86_64)
url="https://github.com/neolabs-software/sham"
license=('GPL')
groups=()
depends=(gcc)
makedepends=(gcc)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/NEOLabs-software/ShAm/archive/refs/tags/3.0.0.tar.gz")
noextract=()
md5sums=('59051b9d8374b79fd1875d1558c47b1b')
validpgpkeys=()
pkgsource="ShAm-3.0.0"

prepare() {
	cd "$pkgsource"
}

build() {
	cd "$pkgsource"
  meson . build
	ninja -C build
}

check() {
	cd "$pkgsource"
	ls build/sham
}

package() {
	cd "$pkgsource"
	DESTDIR=$pkgdir/ ninja -C build install
}
