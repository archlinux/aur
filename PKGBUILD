# Maintainer: ZeroDegress <zerodegress@outlook.com>

pkgname=loongarch64-linux-gnu-binutils-clfs-bin
pkgver=2.41
pkgrel=2
pkgdesc='A set of programs to assemble and manipulate binary and object files, cross tool for Loongarch64 from clfs'
arch=('x86_64')
url='https://github.com/sunhaiyong1978/CLFS-for-LoongArch'
license=('custom')
depends=('clfs-for-loongarch-cross-tools-gcc-bin')
provides=(loongarch64-linux-gnu-binutils)
conflicts=(loongarch64-linux-gnu-binutils)

options=(!strip)

_binlinks=('addr2line' 'ar' 'as' 'c++filt' 'dwp' 'elfedit' 'gp-archive' 'gp-collect-app' 'gp-display-html' 'gp-display-src' 'gp-display-text' 'gprof' 'gprofng' 'ld' 'ld.bfd' 'ld.gold' 'nm' 'objcopy' 'objdump' 'ranlib' 'readelf' 'size' 'strings' 'strip')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  for _bin in "${_binlinks[@]}"; do
    ln -s "/opt/clfs-for-loongarch/cross-tools/bin/loongarch64-unknown-linux-gnu-${_bin}" "${pkgdir}/usr/bin/loongarch64-linux-gnu-${_bin}"
  done
}
