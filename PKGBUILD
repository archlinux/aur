pkgname=rust-lolcat-git
pkgver=r33.4a3059c
pkgrel=1
pkgdesc="A rust implementation of lolcat"
arch=('i686' 'x86_64')
url='https://github.com/magnus-ISU/lolcat-lolhelp'
license=('MIT')
provides=('lolcat')
conflicts=('lolcat')
source=("git+$url")
sha1sums=('SKIP')
makedepends=('cargo' 'git')

build() {
	cd lolcat-lolhelp
	cargo build --release
}

pkgver() {
	cd lolcat-lolhelp
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd lolcat-lolhelp
	install -Dm755 "target/release/lolcat" "$pkgdir/usr/bin/lolcat"
}
