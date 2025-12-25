# Maintainer: Aleksandr Lamandzia <al@ceaseless.dev>
pkgname=kab-git
pkgver=r12.da03c45
pkgrel=1
pkgdesc="Georgian Bible (ძველი ქართული) in the terminal"
arch=(any)
url="https://github.com/dontlosecontrol/kab"
license=('custom:Public Domain')
depends=(bash)
makedepends=(git)
provides=(kab)
conflicts=(kab)
source=('kab::git+https://github.com/dontlosecontrol/kab')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    make kab
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm755 kab "$pkgdir/usr/bin/kab"
}
