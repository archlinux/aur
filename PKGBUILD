# Maintainer: sheep <sheep@sheepdev.xyz>
pkgname=distroeraser-git
pkgver=r40.79a4f7c
pkgrel=1
pkgdesc="A simple disk eraser for Linux"
arch=("any")
url="https://github.com/sheeepdev/distroeraser"
license=('GPL')
provides=("distroeraser")
conflicts=("distroeraser")
depends=("bash" "gum" "coreutils")
makedepends=("git")
source=("git+$url.git")
md5sums=("SKIP")

pkgver() {
	cd distroeraser
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd distroeraser
	make DESTDIR="$pkgdir" install
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/distroeraser/LICENSE"
}
