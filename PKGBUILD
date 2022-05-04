# Maintainer: Léopold Koprivnik Ibghy <skwal.net@gmail.com>
pkgbase="dtodo"
pkgname="dtodo-git"
pkgver=r55.b901ebb
pkgrel=1
pkgdesc="Manage the tasks you want to do every day easily "
arch=('any')
url="https://github.com/SkwalExe/dtodo"
license=('MIT')
makedepends=("git" "make")
provides=("dtodo")
install=dtodo.install
source=("git+$url")
md5sums=("SKIP")

pkgver() {
	cd dtodo
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd dtodo
	# make uninstall
}

build() {
	cd dtodo
	# make
}


package() {
	cd dtodo
	mkdir -p ${pkgdir}/opt/${pkgname}
        cp -rf * ${pkgdir}/opt/${pkgname}
	install -Dm755 ./dtodo.sh "$pkgdir/usr/bin/dtodo"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
}
