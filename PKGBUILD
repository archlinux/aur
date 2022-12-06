# Maintainer: Yurenev Nikolay <yurnik2004 at gmail.com>

pkgname='zvm'
pkgver='0.0.1_beta.3'
pkgrel='3'
pkgdesc='Version manager for Zig compilers'
arch=('x86_64' 'armv7h')
url='https://github.com/tristanisham/zvm'
license=('MIT')
makedepends=('go')
provides=('zig=0.10.0')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/tristanisham/zvm/archive/refs/tags/v0.0.1-beta.3.tar.gz"
)
md5sums=(
    '7a5f0afdc5b8d9e77cb5f33cdc0672c8'
)

build() {
    cd zvm-0.0.1-beta.3
    go build
}

package() {
    cd zvm-0.0.1-beta.3
    mkdir -p "$pkgdir/usr/bin"
    cp zvm "$pkgdir/usr/bin"
}
