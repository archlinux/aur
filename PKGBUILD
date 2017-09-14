# Maintainer: Alad Wenter <alad@mailbox.org>
pkgname=cottage
pkgver=0.3
pkgrel=2
pkgdesc="Use howm commands, operators and set configuration values through a UNIX socket."
arch=('i686' 'x86_64')
url="https://github.com/HarveyHunt/cottage"
license=('GPL')
source=("$pkgname-$pkgver.tar.gz::https://github.com/HarveyHunt/cottage/archive/v$pkgver.tar.gz"
        'fix-ldflags.patch::https://patch-diff.githubusercontent.com/raw/HarveyHunt/cottage/pull/11.patch')
sha256sums=('edf196357f7ff86ff615407926e3aa96007f65c5128990b3fa51bd08677a946b'
            'b8f849db21d230c6fd800c9979e16620970110da2f69b1a646c07399b4481d26')

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 < "$srcdir"/fix-ldflags.patch
}

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 cottage "$pkgdir"/usr/bin/cottage
}

# vim:set ts=2 sw=2 et:
