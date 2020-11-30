# Maintainer: Ben Goldberg <benaaron.dev>

pkgname=chaos
pkgver=0.1.0
pkgrel=1
pkgdesc="A purely functional programming language that achieves zero cyclomatic complexity"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://github.com/chaos-lang/chaos"
license=('GPL-3.0')
source=("https://github.com/chaos-lang/chaos/archive/v$pkgver.tar.gz")
depends=('gcc-libs')
makedepends=('gcc' 'make' 'flex' 'bison')
sha256sums=("f2cd154034c051410845ce5fd3d98da8ad19e68e93e93bb7f25ed32e013fbd80")

build() {
    tar -xf v$pkgver.tar.gz
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    install -D -m755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -D -m644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
