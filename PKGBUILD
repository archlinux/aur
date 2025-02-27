# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=iso-commander
pkgver=5.7.2
pkgrel=3
pkgdesc='The Fastest ISO Manager on the Planet, written in C++'
arch=('x86_64')
url="https://github.com/siyia2/iso-commander"
license=('GPL3')
depends=('coreutils' 'glibc' 'readline' 'util-linux')
makedepends=('gcc' 'make')
md5sums=('db751a0e97fddec1b112c73a382ee467')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

build() {
    cd "${srcdir}/$pkgname-${pkgver}"
    make
}

package() {
    cd "${srcdir}/$pkgname-${pkgver}"
    install -Dm755 isocmd "$pkgdir/usr/bin/isocmd"
    # Install the man page
    install -Dm644 "${srcdir}/$pkgname-$pkgver/man/isocmd.1" "$pkgdir/usr/share/man/man1/isocmd.1"
    mandb
}
