# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=faddeeva-cpp
_pkgname=faddeeva
pkgver=1.0
pkgrel=2
pkgdesc='Faddeeva code to calculate error functions of complex arguments'
url="https://github.com/cdown/faddeeva"
license=('MIT')
arch=('any')
source=("https://github.com/cdown/faddeeva/archive/$pkgver.tar.gz")
md5sums=('01f27f1032c2a1508333d4dd7b48d1cb')

build() {
    cd -- "${srcdir?}/$_pkgname-$pkgver"
    make
}

package() {
    mkdir -p "$pkgdir"/usr/lib "$pkgdir"/usr/include
    cp -a "${srcdir?}/$_pkgname-$pkgver"/libfaddeeva.so.1.0 "$pkgdir"/usr/lib
    cp -a "${srcdir?}/$_pkgname-$pkgver"/Faddeeva.hh "$pkgdir"/usr/include
    ln -s libfaddeeva.so.1.0 "$pkgdir"/usr/lib/libfaddeeva.so.1
    ln -s libfaddeeva.so.1.0 "$pkgdir"/usr/lib/libfaddeeva.so
}
