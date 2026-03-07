# Maintainer: goal10der <goal10derphone@gmail.com>
pkgname=wordleinc
pkgver=1.0.0
pkgrel=1
pkgdesc="A terminal-based Wordle clone written in C with case-insensitive logic."
arch=('x86_64')
url="https://github.com/goal10der/wordleinc"
license=('MIT')
depends=('glibc')
# ADDED 'git' here because you are now using a git source
makedepends=('gcc' 'make' 'git') 
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    make PREFIX=/usr
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}