# Maintainer: Yurenev Nikolay <yurnik2004 at gmail.com>

pkgname='zvm'
pkgver='0.2.1'
pkgrel='1'
pkgdesc='Version manager for Zig compilers'
arch=('x86_64' 'armv7h')
url='https://github.com/tristanisham/zvm'
license=('MIT')
makedepends=('go')
provides=('zig=0.10.1')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/tristanisham/zvm/archive/refs/tags/v0.2.1.tar.gz"
)
md5sums=(
    '41d4093597ba2da0629fdb4b62679425'
)

build() {
    cd zvm-0.2.1
    go build
}

package() {
    cd zvm-0.2.1
    mkdir -p "$pkgdir/usr/bin"
    cp zvm "$pkgdir/usr/bin"
}
