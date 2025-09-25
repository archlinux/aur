# Maintainer: Pranav Unni <pranavu8406@gmail.com>
pkgname=pranshell
pkgver=1.0.0
pkgrel=1
pkgdesc="A custom Unix shell implementation in C"
arch=('x86_64' 'i686')
url="https://github.com/PranavU-Coder/pranshell"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/PranavU-Coder/pranshell/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "pranshell-$pkgver"
    gcc -Wall -O2 src/shell.c -o pranshell
}

package() {
    cd "pranshell-$pkgver"
    install -Dm755 pranshell "$pkgdir/usr/bin/pranshell"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
