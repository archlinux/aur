# Maintainer: Léopold Koprivnik Ibghy <skwal.net@gmail.com>
pkgname="cow-translator-git"
pkgver=r29.25283be
pkgrel=1
pkgdesc="Official moo translator to communicate with cows"
arch=('any')
url="https://github.com/SkwalExe/cow-translator"
license=('MIT')
makedepends=("git" "cargo")
provides=("cow-translator")
install=cow-translator.install
source=("git+$url")
md5sums=("SKIP")

pkgver() {
	cd cow-translator
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd cow-translator
    
}

build() {
	cd cow-translator
	cargo build --release
}


package() {
	cd cow-translator
	mkdir -p ${pkgdir}/opt/${pkgname}
	cp -rf * ${pkgdir}/opt/${pkgname}
	install -Dm755 ./target/release/cow-translator "$pkgdir/usr/bin/cow-translator"
    install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
}
