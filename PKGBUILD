# Maintainer: Karl Ludwig Brennan <karlludwigbrennan@outlook.com>

pkgname=llvm-mingw-w64-toolchain-msvcrt-bin
pkgver=20240518
pkgrel=1
pkgdesc="LLVM/Clang/LLD based mingw-w64 toolchain (MSVCRT) targeting i686, x86-64, armv7, and aarch64"
_crt=msvcrt
arch=('x86_64')
url="https://github.com/mstorsjo/llvm-mingw"
license=('custom')
depends=()
provides=('llvm-mingw-w64-toolchain' 'mingw-w64-binutils' 'mingw-w64-crt' 'mingw-w64-gcc' 'mingw-w64-headers' 'mingw-w64-winpthreads')
conflicts=('mingw-w64-binutils' 'mingw-w64-crt' 'mingw-w64-gcc' 'mingw-w64-headers' 'mingw-w64-winpthreads')
source=("https://github.com/mstorsjo/llvm-mingw/releases/download/${pkgver}/llvm-mingw-${pkgver}-${_crt}-ubuntu-20.04-x86_64.tar.xz")
sha256sums=('ca59291aae8dbaff4f06acaf10e368597643998f98faf17a23d0fad34929a8a6')

options=(!strip)

package() {
	mkdir -p ${pkgdir}/opt/llvm-mingw
	cp -dpr --no-preserve=ownership ./llvm-mingw-${pkgver}-${_crt}-ubuntu-20.04-x86_64/* "${pkgdir}/opt/llvm-mingw"
}
