# Maintainer: Jojii <jojii@gmx.net>
pkgname=bruteforce-luks-git
pkgver=1.0.r46.a18694a
pkgrel=1
epoch=
pkgdesc="The bruteforce-luks git version"
arch=('i686' 'x86_64')
url="https://github.com/glv2/bruteforce-luks"
license=('GPL-3.0')
groups=()
depends=()
makedepends=(
    "git"
)

options=()
install=
changelog=
source=("git+$url")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/bruteforce-luks"
	printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/bruteforce-luks"
	./autogen.sh
    ./configure
    make
}

package() {
	cd "$srcdir/bruteforce-luks"
    mkdir -p $pkgdir/usr/bin
    install -DT bruteforce-luks $pkgdir/usr/bin/bruteforce-luks
}
