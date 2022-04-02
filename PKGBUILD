# Maintainer: Léopold Koprivnik Ibghy <skwal.net@gmail.com>
pkgname="cow-encryptor-git"
pkgver=r6.43722fa
pkgrel=1
pkgdesc="Encrypt your files in cow language"
arch=('any')
url="https://github.com/SkwalExe/cow-encryptor"
license=('MIT')
makedepends=("git" "cargo")
provides=("cow-encryptor")
install=cow-encryptor.install
depends=("cow-translator-git")
source=("git+$url")
md5sums=("SKIP")

pkgver() {
	cd cow-encryptor
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd cow-encryptor
    
}

build() {
	cd cow-encryptor
	cargo build --release
}


package() {
	cd cow-encryptor
	mkdir -p ${pkgdir}/opt/${pkgname}
	cp -rf * ${pkgdir}/opt/${pkgname}
	install -Dm755 ./target/release/cow-encryptor "$pkgdir/usr/bin/cow-encryptor"
    install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
}
