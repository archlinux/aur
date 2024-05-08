# Maintainer: Karl Ludwig Brennan <karlludwigbrennan@outlook.com>

pkgname=llvm-mingw-w64-toolchain-ucrt-bin
pkgver=20240502
pkgrel=1
pkgdesc="LLVM/Clang/LLD based mingw-w64 toolchain (UCRT) targeting i686, x86-64, armv7, and aarch64"
_crt=ucrt
arch=('x86_64')
url="https://github.com/mstorsjo/llvm-mingw"
license=('ISC')
depends=()
provides=('llvm-mingw-w64-toolchain' 'mingw-w64-binutils' 'mingw-w64-crt' 'mingw-w64-gcc' 'mingw-w64-headers' 'mingw-w64-winpthreads')
conflicts=('mingw-w64-binutils' 'mingw-w64-crt' 'mingw-w64-gcc' 'mingw-w64-headers' 'mingw-w64-winpthreads')
source=("https://github.com/mstorsjo/llvm-mingw/releases/download/${pkgver}/llvm-mingw-${pkgver}-${_crt}-ubuntu-20.04-x86_64.tar.xz")
sha256sums=('02b0d21bec4f8408737f244e0011d8596b095b7f5efa6f93b2ef280b5bc7404a')

options=(!strip)

package() {
	mkdir -p ${pkgdir}/opt/llvm-mingw
	cp -dpr --no-preserve=ownership ./llvm-mingw-${pkgver}-${_crt}-ubuntu-20.04-x86_64/* "${pkgdir}/opt/llvm-mingw"
}
