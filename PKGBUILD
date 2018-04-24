
# Maintainer: Jon Nordby <jononor@gmail.com>

pkgname=mmm-git
pkgver=0.1.0.r11.0ae93f1
pkgrel=2
pkgdesc=""
arch=(i686 x86_64)
url=""
license=('MIT')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/hodefoting/mmm.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	#printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"}
}


build() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX=/usr
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
}
