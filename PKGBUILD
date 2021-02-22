# Maintainer: okhsunrog <me@gornushko.com>
pkgname=persway-git
_pkgname=persway
_pkgver=0.4.1
pkgver=0.4.1.r55.4a661a4
pkgrel=1
pkgdesc="Small Sway IPC Daemon"
url="https://github.com/johnae/persway"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=("git+https://github.com/johnae/persway.git")
sha512sums=('SKIP')
provides=('persway')
conflicts=('persway')

pkgver() {
    cd "$_pkgname"
      printf "$_pkgver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	cargo build --release --target-dir "./target"
}

package() {
	cd "$_pkgname"
	install -Dm755 "target/release/persway" "$pkgdir/usr/bin/$_pkgname"
}

