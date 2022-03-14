# Maintainer: Léopold Koprivnik Ibghy <skwal.net@gmail.com>
pkgname="rmini-matrix-git"
pkgver=r5.3c2e760
pkgrel=1
pkgdesc="Rust implementation for mini-matrix - Display random 0 and 1 or custom chars in matric style"
arch=('any')
url="https://github.com/SkwalExe/rmini-matrix"
license=('MIT')
makedepends=("git" "cargo")
provides=("rmini-matrix")
install=rmini-matrix.install
source=("git+$url")
md5sums=("SKIP")

pkgver() {
	cd rmini-matrix
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd rmini-matrix
    
}

build() {
	cd rmini-matrix 
	cargo build --release
}


package() {
	cd rmini-matrix
	mkdir -p ${pkgdir}/opt/${pkgname}
	cp -rf * ${pkgdir}/opt/${pkgname}
	install -Dm755 ./target/release/rmini-matrix "$pkgdir/usr/bin/rmini-matrix"
    install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
}
