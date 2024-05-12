# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=opticpu
pkgver=0.0.1
pkgrel=1
pkgdesc="A utility for optimizing CPU usage and enhancing system performance on Linux."
arch=('x86_64')
url="https://github.com/felipealfonsog/OptiCPU"
license=('GPL')
depends=('gcc' 'glibc' 'libutil-linux' 'coreutils')
source=("$pkgname-$pkgver.tar.gz::https://github.com/felipealfonsog/OptiCPU/archive/v$pkgver.tar.gz")
sha256sums=('234d213d96cd5ba10f575135bde35a0e143c03060490924fd4f968632625bb9e')

build() {
    cd "$srcdir/$pkgname-$pkgver/src"
    gcc -o "$pkgname" "$pkgname.c"
}

package() {
    cd "$srcdir/$pkgname-$pkgver/src"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

