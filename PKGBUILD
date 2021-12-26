# Maintainer: turret. <turret@duck.com>
pkgname=liborca-git
pkgver=r2247.99838def
pkgrel=1
pkgdesc="orca discord bot framework"
arch=(x86_64)
url="https://github.com/cee-studio/orca"
license=('GPL')
groups=()
depends=('curl' 'openssl')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('liborca::git+https://github.com/cee-studio/orca')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
        mkdir -p "$pkgdir/usr/local/"
	make PREFIX="$pkgdir/usr/local/" install
}
