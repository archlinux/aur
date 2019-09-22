# Maintainer: Johannes Bensmann <johannes.bensmann@gmx.de>
pkgname=xmouseless-git
pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=r28.f3a7697
pkgrel=1
pkgdesc='Control the mouse with your keyboard - fast and simple.'
arch=('x86_64')
url="https://github.com/jbensmann/xmouseless"
license=('GPL3')
depends=(libxtst)
makedepends=('git')
provides=()
install=
changelog=
source=("git+$url")
md5sums=('SKIP')

build() {
    cd "${srcdir}/xmouseless"
    make
}

package() {
    install -Dm755 "$srcdir/xmouseless/xmouseless" "$pkgdir/usr/bin/xmouseless"
}
