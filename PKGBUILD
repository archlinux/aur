# Maintainer: nshan651 <nshan651@aur.archlinux.org>
pkgname=excite-cli
pkgver=v0.2.0_alpha
pkgrel=1
pkgdesc="A Terminal-Based Citation Generator"
arch=('x86_64')
url="https://github.com/nshan651/excite-cli"
license=('GPL3')
depends=('lua>=5.1') 
makedepends=()
source=("$url")
#source=("$pkgname-$pkgver.tar.gz"
#        "$pkgname-$pkgver.patch")
#source=("excite-cli::git://github.com/nshan651/excite-cli.git")
#source=("excite-cli::git@github.com:nshan651/excite-cli.git")
md5sums=('SKIP')
#validpgpkeys=()

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
