# Maintainer: Léopold Koprivnik Ibghy <skwal.net@gmail.com>
pkgname="sorting-algorithms-git"
pkgver=r11.24cc340
pkgrel=1
pkgdesc="Sorting algorithms visualizer, in your terminal!"
arch=('any')
url="https://github.com/SkwalExe/sorting-algorithms"
license=('MIT')
makedepends=("git" "make" "clang")
provides=("sorting-algorithms")
install=sorting-algorithms.install
source=("git+$url")
md5sums=("SKIP")

pkgver() {
	cd sorting-algorithms
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd sorting-algorithms
}

build() {
	cd sorting-algorithms
	make 
}


package() {
	cd sorting-algorithms
	mkdir -p ${pkgdir}/opt/${pkgname}
        cp -rf * ${pkgdir}/opt/${pkgname}
        install -Dm755 build/sorting-algorithms "$pkgdir/usr/bin/sorting-algorithms"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
}
