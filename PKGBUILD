pkgname=rust-lolcat-git
pkgver=r35.bfbe248
pkgrel=1
pkgdesc="A rust implementation of lolcat"
arch=('i686' 'x86_64')
url='https://github.com/ur0/lolcat'
license=('MIT')
provides=('lolcat')
conflicts=('lolcat')
source=("git+$url")
sha1sums=('SKIP')
makedepends=('cargo' 'git')

build() {
	cd lolcat
	cargo build --release
}

pkgver() {
	cd lolcat
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd lolcat
	install -Dm755 "target/release/lolcat" "$pkgdir/usr/bin/lolcat"
}
