# Maintainer: Arsen Musayelyan <moussaelianarsen@gmail.com>
pkgname=opensend-git
pkgver=r39.07e35af
pkgrel=1
pkgdesc="Send files and securely across systems"
arch=('any')
license=('Apache-2.0')
makedepends=('go')
source=('git+https://gitea.arsenm.dev/opensend/opensend.git')
md5sums=('SKIP')
backup=('etc/opensend.toml')

pkgver() {
	cd "$srcdir/opensend"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/opensend"
	make
}

package() {
	cd "$srcdir/opensend"
	make DESTDIR="$pkgdir" install
}
