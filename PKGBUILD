# Maintainer: Avery Murray <averylapine@gmail.com>

pkgname=cimplefetch
pkgver=0.1
pkgrel=1
pkgdesc="A simple program to fetch system information written in C"
arch=('any')
url="https://github.com/caverym/cimplefetch"
license=('GPL3')

source=('https://github.com/caverym/cimplefetch/archive/0.1.tar.gz')
sha256sums=('9efe688140117210e127b899cf34571dc29846f75e2b242b4f4e71e3f6b05e3d')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    mkdir -p "$pkgdir"/usr/bin/
    mkdir -p "$pkgdir"/usr/share/licenses/"$pkgname"/

    cp -f "$srcdir/$pkgname-$pkgver"/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/
    install -D -m 755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin"
}