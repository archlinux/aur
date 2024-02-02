# Maintainer: Yurenev Nikolay <yurnik2004 at gmail.com>

pkgname='zvm'
pkgver='0.5.3'
pkgrel='1'
pkgdesc='Version manager for Zig compilers'
arch=('x86_64' 'armv7h')
url='https://github.com/tristanisham/zvm'
license=('MIT')
makedepends=('go')
provides=('zig=0.11.0')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/tristanisham/zvm/archive/refs/tags/v$pkgver.tar.gz"
)
md5sums=(
    'b30cfc445e2047deb00a6b32284b31c7'
)

build() {
    cd $pkgname-$pkgver
    go build
}

package() {
    cd $pkgname-$pkgver
    mkdir -p "$pkgdir/usr/bin"
    cp zvm "$pkgdir/usr/bin"
}
