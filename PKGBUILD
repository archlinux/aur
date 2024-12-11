# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=iso-commander
pkgver=5.3.6
pkgrel=2
pkgdesc='The Fastest ISO Manager on the Planet, written in C++'
arch=('x86_64')
url="https://github.com/siyia2/iso-commander"
license=('GPL3')
depends=('coreutils' 'glibc' 'readline' 'util-linux')
md5sums=('785a641ff42eb04046ea6ea8ef3b1ed6')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

build() {
    cd "${srcdir}/$pkgname-${pkgver}"
    make
}

package() {
    cd "${srcdir}/$pkgname-${pkgver}"
    install -Dm755 isocmd "$pkgdir/usr/bin/isocmd"
    # Install the man page
    cd
    install -Dm755 "${srcdir}/$pkgname-$pkgver/man/isocmd.1" "$pkgdir/usr/share/man/man1/isocmd.1"
}
