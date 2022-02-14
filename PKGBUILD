# Maintainer: Léopold Koprivnik Ibghy <skwal.net@gmail.com>
pkgname="dtodo-git"
pkgver=r9.85c9956
pkgrel=1
pkgdesc="Manage the tasks you want to do every day easily "
arch=(x86_64 i686)
url="https://github.com/SkwalExe/dtodo"
license=('MIT')
depends=()
makedepends=("git" "make")
checkdepends=()
optdepends=()
provides=("dtodo" "daily-todo")
conflicts=()
replaces=()
backup=()
options=()
install=dtodo.install
changelog=
source=("git+$url")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

pkgver() {
	cd dtodo
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd dtodo
	make uninstall
}

build() {
	cd dtodo
	# make
}


package() {
	cd dtodo
	install -Dm755 ./dtodo.sh "$pkgdir/usr/bin/dtodo"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
}
