# Maintainer: goal10der <goal10derphone@gmail.com>
pkgname=wordleinc
pkgver=1.0.0
pkgrel=1
pkgdesc="A terminal-based Wordle clone written in C with case-insensitive logic."
arch=('x86_64')
url="https://github.com/goal10der/wordleinc"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'make')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}