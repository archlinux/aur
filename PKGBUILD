# Maintainer: snemc <3112671039@qq.com>
pkgname=pauser
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc="一个开源的检测程序运行算法问题的耗时和内存占用的小工具."
arch=('x86_64')
url="https://github.com/jswysnemc/ConsolePauserPlusPlus"
license=('GPL-3.0-only')
depends=("glibc")
makedepends=("git" "make" "gcc" "glibc")
source=("$pkgname-$pkgver::git+https://github.com/jswysnemc/ConsolePauserPlusPlus.git")
noextract=("${source[@]##*/}")
md5sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 ./build/bin/pauser "$pkgdir"/usr/bin/pauser
}
