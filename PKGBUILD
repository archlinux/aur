# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Yurenev Nikolay <yurnik2004 at gmail.com>

pkgname='zvm'
pkgver='0.8.6'
pkgrel='1'
pkgdesc='Version manager for Zig compilers'
arch=('x86_64' 'armv7h')
url='https://github.com/tristanisham/zvm'
license=('MIT')
makedepends=('go')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/tristanisham/zvm/archive/refs/tags/v$pkgver.tar.gz"
)

md5sums=('163876a264fba17f735b0c5e47ae4c0e')

build() {
    cd $pkgname-$pkgver
    go build
}

package() {
    cd $pkgname-$pkgver
    mkdir -p "$pkgdir/usr/bin"
    cp zvm "$pkgdir/usr/bin"
}
