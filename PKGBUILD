# Maintainer: Duologic <jeroen@simplsitic.be>

pkgname=clipscreen-git
pkgver=r27.b654271
pkgrel=1
pkgdesc="Mirror a portion of your screen to a virtual monitor for easier screen sharing."
arch=('x86_64')
url="https://github.com/splitbrain/clipscreen"
license=('unkown')
depends=()
makedepends=('git' 'libx11')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make all
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 "clipscreen" "$pkgdir/usr/bin/clipscreen"
}
