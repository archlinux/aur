# Maintainer: Karl Ludwig Brennan <karlludwigbrennan@outlook.com>

pkgname=llvm-mingw-w64-toolchain-ucrt-bin
pkgver=20250528
pkgrel=1
pkgdesc="LLVM/Clang/LLD based mingw-w64 toolchain (UCRT) targeting i686, x86-64, armv7, and aarch64"
_crt=ucrt
_distro=ubuntu-22.04
arch=('aarch64' 'x86_64')
url="https://github.com/mstorsjo/llvm-mingw"
license=('custom')
depends=()
provides=('llvm-mingw-w64-toolchain' 'mingw-w64-binutils' 'mingw-w64-crt' 'mingw-w64-gcc' 'mingw-w64-headers' 'mingw-w64-winpthreads')
source=("https://github.com/mstorsjo/llvm-mingw/releases/download/${pkgver}/llvm-mingw-${pkgver}-${_crt}-${_distro}-${CARCH}.tar.xz")
if [ "$CARCH" = "aarch64" ]; then
  sha256sums=('1064fa03e5430261202365475c21412aca1958bab7faf7d6f5bcb7c75b7fd6d7')
else
  sha256sums=('b6a446193e65ef43ac393dd0767824e4a2c0a6a099505d990a5e56b867a47b40')
fi

options=(!strip)

package() {
	mkdir -p ${pkgdir}/opt/llvm-mingw/llvm-mingw-$_crt
	cp -dpr --no-preserve=ownership ./llvm-mingw-${pkgver}-${_crt}-${_distro}-${CARCH}/* "${pkgdir}/opt/llvm-mingw/llvm-mingw-$_crt"
}
