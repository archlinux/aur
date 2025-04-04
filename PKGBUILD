# Maintainer: Karl Ludwig Brennan <karlludwigbrennan@outlook.com>

pkgname=llvm-mingw-w64-toolchain-ucrt-bin
pkgver=20250402
pkgrel=1
pkgdesc="LLVM/Clang/LLD based mingw-w64 toolchain (UCRT) targeting i686, x86-64, armv7, and aarch64"
_crt=ucrt
arch=('aarch64' 'x86_64')
url="https://github.com/mstorsjo/llvm-mingw"
license=('custom')
depends=()
provides=('llvm-mingw-w64-toolchain' 'mingw-w64-binutils' 'mingw-w64-crt' 'mingw-w64-gcc' 'mingw-w64-headers' 'mingw-w64-winpthreads')
source=("https://github.com/mstorsjo/llvm-mingw/releases/download/${pkgver}/llvm-mingw-${pkgver}-${_crt}-ubuntu-20.04-${CARCH}.tar.xz")
if [ "$CARCH" = "aarch64" ]; then
  sha256sums=('1fc4657db23b9a110b33714157618dbd60c5194d3d52359a883b119f7696b829')
else
  sha256sums=('a23248baa1447df94ed14dce07997ab01da45bda74ac5370bbd098ed1c56a362')
fi

options=(!strip)

package() {
	mkdir -p ${pkgdir}/opt/llvm-mingw/llvm-mingw-$_crt
	cp -dpr --no-preserve=ownership ./llvm-mingw-${pkgver}-${_crt}-ubuntu-20.04-${CARCH}/* "${pkgdir}/opt/llvm-mingw/llvm-mingw-$_crt"
}
