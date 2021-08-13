# Maintainer: Ben Goldberg <benaaron.dev>

pkgname=gemgen
pkgver=0.2.0
pkgrel=1
pkgdesc="A Markdown to Gemtext generator"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://sr.ht/~kota/gemgen/"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~kota/gemgen/archive/v$pkgver.tar.gz")
makedepends=('go' 'scdoc' 'make' 'sed')
sha256sums=('9deeaeba81cac61caa7992392cee409a18219d35d86c4c958a67d54fdef99ba4')

build() {
    cd "$srcdir/$pkgname-v$pkgver"
    make all
}

package() {
    cd "$srcdir/$pkgname-v$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
