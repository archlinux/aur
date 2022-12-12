# Maintainer: Yurenev Nikolay <yurnik2004 at gmail.com>

pkgname='zvm'
pkgver='0.1.3'
pkgrel='1'
pkgdesc='Version manager for Zig compilers'
arch=('x86_64' 'armv7h')
url='https://github.com/tristanisham/zvm'
license=('MIT')
makedepends=('go')
provides=('zig=0.10.0')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/tristanisham/zvm/archive/refs/tags/v0.1.3.tar.gz"
)
md5sums=(
    'b64b0ce99cb1125556d288150c0a9c63'
)

build() {
    cd zvm-0.1.3
    go build
}

package() {
    cd zvm-0.1.3
    mkdir -p "$pkgdir/usr/bin"
    cp zvm "$pkgdir/usr/bin"
}
