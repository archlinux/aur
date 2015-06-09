# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
pkgname=xcape
pkgver=1.1
pkgrel=1
pkgdesc="Configure modifier keys to act as other keys when pressed and released on their own"
arch=('i686' 'x86_64')
url="https://github.com/alols/xcape"
license=('GPL3')
changelog=ChangeLog
depends=('libxtst')
conflicts=('xcape-git')
source=("https://github.com/alols/xcape/archive/v${pkgver}.tar.gz")
sha256sums=('69ae927a6b2b1268a809b9c3af7c4f94584458f022beb6e2ca3e6bc3ba8a6d4a')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" MANDIR="/share/man/man1" install
    install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

