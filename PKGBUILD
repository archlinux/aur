# Maintainer: Sem Lindhout <capnhawkbill at airmail dot cc>
pkgname=torrentfind-git
pkgver=r2.43dc47f
pkgrel=1
pkgdesc="A cli tool that finds torrents on 1337x.to"
arch=('any')
url="https://gitlab.com/capnhawkbill/torrentfind"
license=('GPL')
groups=()
depends=()
makedepends=('git' 'cargo')
provides=("$pkgname")
conflicts=("$pkgname")
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+https://gitlab.com/capnhawkbill/torrentfind.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	cargo build --release
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm 755 target/release/torrentfind -t "${pkgdir}/usr/bin"
}
