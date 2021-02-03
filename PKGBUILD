# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Peter <craven@gmx.net>
pkgname=bones
pkgver=20150929
pkgrel=3
pkgdesc="A simple Scheme compiler for x86_64 systems"
arch=(x86_64)
url="http://www.call-with-current-continuation.org/bones/"
license=('unknown')
groups=()
depends=(nasm)
makedepends=(nasm gcc)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.call-with-current-continuation.org/${pkgname}/${pkgname}.tar.gz")
md5sums=('3f1f9eac4c5f592d72c677c7335ba2c8')
noextract=()
validpgpkeys=()

build() {
  cd "$pkgname-2015-09-29"
  nasm -f elf64 bones-x86_64-linux.s -o bones.o
  gcc -no-pie bones.o -o bones -lrt
}

package() {
  cd "$pkgname-2015-09-29"
  install -d ${pkgdir}/usr/bin/
  install bones ${pkgdir}/usr/bin/
  install -d ${pkgdir}/usr/share/bones/
  install -D alexpand.scm ${pkgdir}/usr/share/bones/alexpand.scm
  install -D all.scm ${pkgdir}/usr/share/bones/all.scm
  install -D base.scm ${pkgdir}/usr/share/bones/base.scm
  install -D bones-autocompile ${pkgdir}/usr/share/bones/bones-autocompile
  install -D bones.scm ${pkgdir}/usr/share/bones/bones.scm
  install -D bones-x86_64-bsd.s ${pkgdir}/usr/share/bones/bones-x86_64-bsd.s
  install -D bones-x86_64-linux.s ${pkgdir}/usr/share/bones/bones-x86_64-linux.s
  install -D bones-x86_64-mac.s ${pkgdir}/usr/share/bones/bones-x86_64-mac.s
  install -D bones-x86_64-windows.s ${pkgdir}/usr/share/bones/bones-x86_64-windows.s
  install -D cc.scm ${pkgdir}/usr/share/bones/cc.scm
  install -D cmplr.scm ${pkgdir}/usr/share/bones/cmplr.scm
  install -D constants.c ${pkgdir}/usr/share/bones/constants.c
  install -D copy.scm ${pkgdir}/usr/share/bones/copy.scm
  install -D cp.scm ${pkgdir}/usr/share/bones/cp.scm
  install -D cps.scm ${pkgdir}/usr/share/bones/cps.scm
  install -D eval.scm ${pkgdir}/usr/share/bones/eval.scm
  install -D fastmath.scm ${pkgdir}/usr/share/bones/fastmath.scm
  install -D main.scm ${pkgdir}/usr/share/bones/main.scm
  install -D mangle.scm ${pkgdir}/usr/share/bones/mangle.scm
  install -D MANUAL.txt ${pkgdir}/usr/share/bones/MANUAL.txt
  install -D match.scm ${pkgdir}/usr/share/bones/match.scm
  install -D megalet.scm ${pkgdir}/usr/share/bones/megalet.scm
  install -D nonstd.scm ${pkgdir}/usr/share/bones/nonstd.scm
  install -D pp.scm ${pkgdir}/usr/share/bones/pp.scm
  install -D program.scm ${pkgdir}/usr/share/bones/program.scm
  install -D r5rs.scm ${pkgdir}/usr/share/bones/r5rs.scm
  install -D ra.scm ${pkgdir}/usr/share/bones/ra.scm
  install -D records.scm ${pkgdir}/usr/share/bones/records.scm
  install -D simplify.scm ${pkgdir}/usr/share/bones/simplify.scm
  install -D si.scm ${pkgdir}/usr/share/bones/si.scm
  install -D sort.scm ${pkgdir}/usr/share/bones/sort.scm
  install -D source.scm ${pkgdir}/usr/share/bones/source.scm
  install -D support.scm ${pkgdir}/usr/share/bones/support.scm
  install -D tsort.scm ${pkgdir}/usr/share/bones/tsort.scm
  install -D uv.scm ${pkgdir}/usr/share/bones/uv.scm
  install -D version.scm ${pkgdir}/usr/share/bones/version.scm
  install -D x86_64.scm ${pkgdir}/usr/share/bones/x86_64.scm
  install -D x86_64/boneslib.s ${pkgdir}/usr/share/bones/x86_64/boneslib.s
  install -D x86_64/fastmath.scm ${pkgdir}/usr/share/bones/x86_64/fastmath.scm
  install -D x86_64/intrinsics.scm ${pkgdir}/usr/share/bones/x86_64/intrinsics.scm
  install -D x86_64/linux/constants.scm ${pkgdir}/usr/share/bones/x86_64/linux/constants.scm
  install -D x86_64/linux/syscalls-nolibc.scm ${pkgdir}/usr/share/bones/x86_64/linux/syscalls-nolibc.scm
  install -D x86_64/linux/syscalls.scm ${pkgdir}/usr/share/bones/x86_64/linux/syscalls.scm
}
