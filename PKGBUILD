# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Ayoub Eddaoudi <me@ayoubedd.me>
pkgname=zfind
pkgver=0.4.7
pkgrel=1
pkgdesc="Search for files (even inside tar/zip/7z/rar) using a SQL-WHERE filter"
arch=('x86_64' 'arm64' 'riscv64')
url="https://github.com/laktak/zfind"
license=('MIT')
makedepends=(git go)
provides=(zfind)
source=("$pkgname-$pkgver::git+$url")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname-$pkgver"
	git checkout "v$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	scripts/build
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 zfind "$pkgdir/usr/bin/zfind"
}
