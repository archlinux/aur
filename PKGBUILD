# Maintainer: Roxie Gibson <me@roxanne.dev>

pkgname=abra-git
pkgver=r191.cc9c690
pkgrel=1
pkgdesc="The Co-op Cloud command-line interface 🎩🐇"
arch=("x86_64" "i686" "aarch64")
makedepends=("git" "go" "make")
url="https://git.coopcloud.tech/coop-cloud/go-abra"
license=('MIT')
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/go-abra"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/go-abra";
	make build;
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -p -m755 "$srcdir/go-abra/abra" "$pkgdir/usr/bin"
	#install -Dm644 "$srcdir/go-abra/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
