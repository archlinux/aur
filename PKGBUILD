# Maintainer: ZeroDegress <zerodegress@outlook.com>

pkgname=loongarch64-linux-gnu-gcc-clfs-bin
pkgver=13.2.0
pkgrel=2
pkgdesc='Cross compiler for Loongarch64 from clfs'
arch=('x86_64')
url='https://github.com/sunhaiyong1978/CLFS-for-LoongArch'
license=('custom')
depends=('clfs-for-loongarch-cross-tools-gcc-bin')
provides=(loongarch64-linux-gnu-gcc)
conflicts=(loongarch64-linux-gnu-gcc)

options=(!strip)

_binlinks=('gcc' 'g++' 'c++' 'cpp' 'gcc-ar' 'gcc-nm' 'gcc-ranlib' 'gcov' 'gcov-dump' 'gcov-tool' 'lto-wrapper' 'collect2' 'xgcc')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  for _bin in "${_binlinks[@]}"; do
    ln -s "/opt/clfs-for-loongarch/cross-tools/bin/loongarch64-unknown-linux-gnu-${_bin}" "${pkgdir}/usr/bin/loongarch64-linux-gnu-${_bin}"
  done
}
