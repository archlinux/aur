# Maintainer: nshan651 <nshan651@aur.archlinux.org>
pkgname=excite-cli
pkgver=v0.2.0_alpha
pkgrel=1
pkgdesc="A Terminal-Based Citation Generator"
arch=('x86_64')
url="git+https://github.com/nshan651/excite-cli"
license=('GPL3')
depends=('lua>=5.1' 'luarocks') 
makedepends=()
source=("$url")
md5sums=('SKIP')

build() {
    luarocks install --local lua-curl
    luarocks install --local busted
    luarocks install --local argparse
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir/" install
}
