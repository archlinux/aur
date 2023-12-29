# Maintainer: IroAlexis <iroalexis@outlook.com>

pkgname=lunion-git
pkgver=0.5.0
pkgrel=1
epoch=0
pkgdesc="Wine wrapper for running Windows games on Linux"
arch=(x86_64)
url="https://framagit.org/IroAlexis/lunion"
license=(GPL)
groups=()
depends=(glib2)
makedepends=(
	git
	meson
)
checkdepends=()
optdepends=(
	wine
	wine-staging
)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+${url}.git)
cksums=('SKIP')
noextract=()

#prepare() {
	# TODO Update $pkgver
#}

build() {
	meson setup --prefix "/usr" ./lunion ./build
	meson compile -C ./build
}

package() {
	#cd "$pkgname"
	meson install -C ./build --destdir "$pkgdir"
}
