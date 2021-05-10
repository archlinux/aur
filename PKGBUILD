# Maintainer: Grigory Vasilyev <echo "h0tc0d3(-*A*-)g-m*a-i-l(-d#t-)c#m" | sed -e 's/-//ig;s/*//ig;s/(A)/@/i;s/#/o/ig;s/(dot)/./i'>

validpgpkeys=('33ED753E14757D79FA17E57DC4C1F715B2B66B95')

pkgname=llvm11-fallback
pkgver=11.1.0
pkgrel=1
arch=('x86_64')
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
pkgdesc="LLVM ${pkgver} runtime libraries for LLVM >= 12.0.0. It's fallback package for programs like rust, qtcreator which use llvm 11."
depends=('gcc-libs' 'zlib' 'libffi' 'libedit' 'ncurses' 'libxml2')
options=('staticlibs')
source=(
  "llvm-libs-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst::https://archlinux.org/packages/extra/x86_64/llvm-libs/download/"
  "clang-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst::https://archlinux.org/packages/extra/x86_64/clang/download/"
)

sha256sums=(
  '978a1fd05f0207772584dee775eb926c3d1dcd7e0b2f8c694bfe2dbb0d20a004'
  '84ba4f67027fbe3ad73e2a9c321390111a8e428665101461f968f55c2097504c')
sha512sums=(
  'b61d89e5199a1e8859689a8ae2e85b30486d4da1ac6bcf4cafa9a3556b0b45fef7fc310327fade1fd42d183d06b5648ffa5ad8922b1282ca016e5468256e5feb'
  '7891dd8de24b2f266dc5e51ffe2a496a284df04ae0ade67b8c8674d72ce80f40a576509bf48c722446aa44cb6469f8a5a0865fa9c68da69124f2b6aa6628d609')

package() {

  install -Dm644 "${srcdir:?}/usr/lib/libLLVM-11.so" "${pkgdir:?}/usr/lib/libLLVM-11.so"
  install -Dm644 "${srcdir:?}/usr/lib/libLTO.so.11" "${pkgdir:?}/usr/lib/libLTO.so.11"
  install -Dm644 "${srcdir:?}/usr/lib/libRemarks.so.11" "${pkgdir:?}/usr/lib/libRemarks.so.11"
  install -Dm644 "${srcdir:?}/usr/lib/libclang.so.11.1" "${pkgdir:?}/usr/lib/libclang.so.11.1"
  install -Dm644 "${srcdir:?}/usr/lib/libclang-cpp.so.11.1" "${pkgdir:?}/usr/lib/libclang-cpp.so.11.1"
  install -Dm644 "${srcdir:?}/usr/share/licenses/llvm-libs/LICENSE" "${pkgdir:?}/usr/share/licenses/${pkgname}/LICENSE"
  ln -s /usr/lib/libLLVM-11.so "${pkgdir:?}/usr/lib/libLLVM-11.1.0.so"

}
