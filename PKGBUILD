pkgname=mold-git
pkgver=r2562.6319135
pkgrel=1
pkgdesc="Fast linker"
arch=(x86_64)
url="https://github.com/rui314/mold"
license=("unknown")
depends=(gcc-libs openssl zlib)
makedepends=(clang cmake git)
source=("mold::git+https://github.com/rui314/mold")
sha256sums=("SKIP")
reponame="mold"

pkgver() {
	cd $srcdir/$reponame
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $reponame
	make
}

package() {
	install -Dm755 $srcdir/mold/mold "$pkgdir/usr/bin/mold"
}
