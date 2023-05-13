# Maintainer: Yurenev Nikolay <yurnik2004 at gmail.com>

pkgname='zvm'
pkgver='0.2.2'
pkgrel='1'
pkgdesc='Version manager for Zig compilers'
arch=('x86_64' 'armv7h')
url='https://github.com/tristanisham/zvm'
license=('MIT')
makedepends=('go')
provides=('zig=0.10.1')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/tristanisham/zvm/archive/refs/tags/v0.2.2.tar.gz"
)
md5sums=(
    '6a81ac6bc45c604e3a5e4a7066e69beb'
)

build() {
    cd zvm-0.2.2
    go build
}

package() {
    cd zvm-0.2.2
    mkdir -p "$pkgdir/usr/bin"
    cp zvm "$pkgdir/usr/bin"
}
