# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Yurenev Nikolay <yurnik2004 at gmail.com>

pkgname='zvm'
pkgver='0.7.6'
pkgrel='1'
pkgdesc='Version manager for Zig compilers'
arch=('x86_64' 'armv7h')
url='https://github.com/tristanisham/zvm'
license=('MIT')
makedepends=('go')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/tristanisham/zvm/archive/refs/tags/v$pkgver.tar.gz"
)

md5sums=('1049f331f9163bd98895b02f9071effb')

build() {
    cd $pkgname-$pkgver
    go build
}

package() {
    cd $pkgname-$pkgver
    mkdir -p "$pkgdir/usr/bin"
    cp zvm "$pkgdir/usr/bin"
}
