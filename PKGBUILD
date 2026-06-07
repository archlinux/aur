# Maintainer: vidasik <https://github.com>
pkgname=novaread
pkgver=26.06
pkgrel=1
pkgdesc="Minimalist and stylish system information fetch tool written in Lua"
arch=('any')
url="https://github.com/vidasik/novaread"
license=('MIT')
depends=('lua')
makedepends=('git')
provides=('novaread')
conflicts=('novaread')

source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/novaread"
    printf "26.06.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/novaread"
    install -Dm755 main.lua "$pkgdir/usr/bin/novaread"
}
