# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Ayoub Eddaoudi <me@ayoubedd.me>
pkgname=zfind
pkgver=0.4.1
pkgrel=1
epoch=
pkgdesc="Search for files (even inside tar/zip/7z/rar) using a SQL-WHERE filter"
arch=('x86_64' 'arm64' 'riscv64')
url="https://github.com/laktak/zfind"
license=('MIT')
groups=()
depends=()
makedepends=(git go)
checkdepends=()
optdepends=()
provides=(zfind)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

# prepare() {
# 	cd "$pkgname-$pkgver"
# 	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
# }

build() {
	cd "zfind"
	go build -o zfind ./cmd/zfind/main.go ./cmd/zfind/help.go
}

# check() {
# 	cd "$pkgname-$pkgver"
# 	make -k check
# }

package() {
	cd "zfind"
	install -Dm755 zfind "$pkgdir/usr/bin/zfind"
}
