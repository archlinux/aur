# Maintainer: Karl Ludwig Brennan <karlludwigbrennan@outlook.com>

pkgname=llvm-mingw-w64-toolchain-ucrt-bin
pkgver=20240619
pkgrel=2
pkgdesc="LLVM/Clang/LLD based mingw-w64 toolchain (UCRT) targeting i686, x86-64, armv7, and aarch64"
_crt=ucrt
arch=('x86_64')
url="https://github.com/mstorsjo/llvm-mingw"
license=('custom')
depends=()
provides=('llvm-mingw-w64-toolchain' 'mingw-w64-binutils' 'mingw-w64-crt' 'mingw-w64-gcc' 'mingw-w64-headers' 'mingw-w64-winpthreads')
source=("https://github.com/mstorsjo/llvm-mingw/releases/download/${pkgver}/llvm-mingw-${pkgver}-${_crt}-ubuntu-20.04-x86_64.tar.xz")
sha256sums=('27d33157cc252c29ad6f777a96a0d94176fea1b534ff09b5071485def143b90e')

options=(!strip)

package() {
	mkdir -p ${pkgdir}/opt/llvm-mingw/llvm-mingw-$_crt
	cp -dpr --no-preserve=ownership ./llvm-mingw-${pkgver}-${_crt}-ubuntu-20.04-x86_64/* "${pkgdir}/opt/llvm-mingw/llvm-mingw-$_crt"
}
