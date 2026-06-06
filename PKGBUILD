# Maintainer: vidasik <https://github.com>
pkgname=nvfsys-git
pkgver=1.0.0
pkgrel=3
pkgdesc="Minimalist and stylish system information fetch tool written in Lua"
arch=('any')
url="https://github.com/vidasik/novafetch"
license=('MIT')
depends=('lua')
makedepends=('git')
provides=('nvfsys')
conflicts=('nvfsys')

source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/novafetch"
    printf "1.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/novafetch"
    install -Dm755 main.lua "$pkgdir/usr/bin/nvfsys"
}
