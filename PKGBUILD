# Maintainer: Andrei Alexeyev <akari@alienslab.net>

pkgname=rmqcc-git
pkgver=r419.c1f930e
pkgrel=1
pkgdesc="RocketMinsta QuakeC Compiler (FTEQCC fork)"
arch=('i686' 'x86_64')
url="https://github.com/kasymovga/rmqcc"
license=('GPL2')
groups=()
depends=('glibc')
makedepends=('git' 'make')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/kasymovga/rmqcc')
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
    install -Dm755 rmqcc.bin "$pkgdir/usr/bin/rmqcc"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
