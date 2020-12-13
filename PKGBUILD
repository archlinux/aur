# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=memstrack
pkgver=0.1.12
pkgrel=1
pkgdesc="A memory allocation trace, like a hot spot analyzer for memory allocation"
arch=('any')
url="https://github.com/ryncsn/memstrack"
license=('GPL3')
makedepends=('gcc' 'ncurses')
source=("https://github.com/ryncsn/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('2e0150b41be36d99fb9e3f25f75da1755a598b408c517e25ffd8c3e727b32eb9')

build() {
    cd $pkgname-$pkgver
    make
}

package() {
    cd $pkgname-$pkgver
    install -Dt "$pkgdir/usr/bin" -m755 memstrack
    install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE
}
