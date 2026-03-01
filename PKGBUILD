pkgname=lithium
pkgver=0.4
pkgrel=1
pkgdesc="Simple package manager"
arch=('x86_64')
url="https://codeberg.org/holos/lithium"
license=('MIT')
depends=('libconfig' 'wget')
makedepends=('git' 'just')
provides=('lithium')
conflicts=('lithium')
source=("git+https://codeberg.org/holos/lithium.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/lithium"
	printf "0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/lithium"
	just all
}

package() {
	cd "$srcdir/lithium"
	install -Dm755 lithium "$pkgdir/usr/bin/lithium"  
}
