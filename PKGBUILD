# Maintainer: Léopold Ibghy Koprivnik <skwal.net@gmail.com>
pkgbase=mini-matrix-git
pkgname=mini-matrix-git
pkgver=r28.21d3eda
pkgrel=1
pkgdesc="Displays a matrix of random characters"
arch=("any")
url="https://github.com/SkwalExe/mini-matrix.git"
license=('MIT')
makedepends=("git" "make")
provides=("mini-matrix")
install=mini-matrix.install
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd mini-matrix
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd mini-matrix
	# make uninstall
}

build() {
    	cd mini-matrix
    	# make
}

package() {
    	cd mini-matrix
    	mkdir -p ${pkgdir}/opt/${pkgname}
    	cp -rf * ${pkgdir}/opt/${pkgname}
    	install -Dm755 ./mini-matrix.sh "$pkgdir/usr/bin/mini-matrix"
        install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
	
}
