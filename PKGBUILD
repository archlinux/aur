# Maintainer: Yurenev Nikolay <yurnik2004 at gmail.com>

pkgname='zvm'
pkgver='0.0.1_beta'
pkgrel='2'
pkgdesc='Version manager for Zig compilers'
arch=('x86_64')
url='https://github.com/tristanisham/zvm'
license=('MIT')
makedepends=('go')
provides=('zig=0.10.0')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/tristanisham/zvm/archive/refs/tags/v0.0.1-beta.tar.gz"
)
md5sums=(
    '9827ebf272f7cec66cd9ecde1b268385'
)

build() {
    cd zvm-0.0.1-beta
    go build
}

package() {
    cd zvm-0.0.1-beta
    mkdir -p "$pkgdir/usr/bin"
    cp zvm "$pkgdir/usr/bin"
}
