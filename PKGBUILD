# Maintainer: qwence <queen.wenceslas@gmail.com>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
pkgname=xcape
pkgver=1.2
pkgrel=1
pkgdesc="Configure modifier keys to act as other keys when pressed and released on their own"
arch=('i686' 'x86_64')
url="https://github.com/alols/xcape"
license=('GPL3')
changelog=ChangeLog
depends=('libxtst')
conflicts=('xcape-git')
source=("https://github.com/alols/xcape/archive/v${pkgver}.tar.gz")
sha256sums=('a27ed884fd94f03058af65a39edfe3af3f2f8fbb76ba9920002a76be07fb2821')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" MANDIR="/share/man/man1" install
    install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

