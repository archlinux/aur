# Maintainer: curlywei <dewei0724@gmail.com>

_target=arm-linux-musleabihf
_host=x86_64
_pkgdate=2023.06
_pkgrev=1
_compiler_supplier=linaro
_compiler_version_major=11
_compiler_version_minor=2
_compiler_version_rel=1

pkgname=${_target}-cross-bin
pkgver=${_compiler_version_major}.${_compiler_version_minor}
pkgrel=${_compiler_version_rel}
epoch=
pkgdesc="Static, binary released  musl-based cross-compilation toolchain provided by musl.cc"
arch=(${_host})
url="https://more.musl.cc"
license=('MIT')
groups=(${_target}-toolchain-bin)
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs !strip staticlibs)
install=
changelog=
source=(${url}/${pkgver}.${pkgrel}/${_host}-linux-musl/${_target}-cross.tgz)
sha512sums=('44df5fdc148c99dbdecd668b0a8a5fb02d5d81fce78fd5930c4b82aee0d237681f05a213e1d19f27f1e97942dd00952d69c28549cfeb4feeaabb820a836f194d')


package() {
	mkdir -p ${pkgdir}/usr
	cp -a ${srcdir}/${_target}-cross/* ${pkgdir}/usr
  
	rm -f   ${pkgdir}/usr/*-manifest.txt
  rm -f   ${pkgdir}/usr/bin/runtest
  rm -f   ${pkgdir}/usr/lib/lib*
  rm -f   ${pkgdir}/usr/lib/bfd-plugins/libdep.a
  rm -rf  ${pkgdir}/usr/include
  rm -rf  ${pkgdir}/usr/share/{dejagnu,doc,gcc-*,gdb,info,locale}
  rm -rf  ${pkgdir}/usr/share/man/{man1/runtest.1,man5,man7}

}

