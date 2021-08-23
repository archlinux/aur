# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: JFelix Golatofski <contact@xdfr.de>
# Contributor: Javier Tiá <javier dot tia at gmail dot com>

pkgname=clang+llvm-binaries
pkgver=11.1.0
pkgrel=1
pkgdesc="Official Clang and LLVM pre-built binaries"
arch=(x86_64)
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
options=(!strip)
source=('clang+llvm-binaries.conf')
source_x86_64=("https://github.com/llvm/llvm-project/releases/download/llvmorg-${pkgver}/clang+llvm-${pkgver}-x86_64-linux-gnu-ubuntu-20.10.tar.xz")
sha256sums=('357a947f26e11202ef8161d4fd8116177de8038f1df60845bb9b95c3c17dec03')
sha256sums_x86_64=('29b07422da4bcea271a88f302e5f84bd34380af137df18e33251b42dd20c26d7')

package() {
  cd "${srcdir}/clang+llvm-${pkgver}-x86_64-linux-gnu-ubuntu-20.10"
  install -D ../clang+llvm-binaries.conf -t "${pkgdir}/etc/ld.so.conf.d/"
  install -d "${pkgdir}/opt/clang+llvm11"
  cp -r * "${pkgdir}/opt/clang+llvm11/"
}
