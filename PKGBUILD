# Maintainer: Brian Bidulock <bidulock@openss7.org>
# vim:set ts=2 sw=2 et:
pkgbase=linux-musl-bin
pkgname=(
    aarch64-linux-musl-bin
    arm-linux-musleabi-bin
    arm-linux-musleabihf-bin
    armv6-linux-musleabihf-bin
    armv7l-linux-musleabihf-bin
    i686-linux-musl-bin
    loongarch64-linux-musl-bin
    mips-linux-musl-bin
    mips64-linux-musl-bin
    mips64el-linux-musl-bin
    mipsel-linux-musl-bin
    powerpc-linux-musl-bin
    powerpc64le-linux-musl-bin
    riscv64-linux-musl-bin
    s390x-linux-musl-bin
    x86_64-linux-musl-bin
)
pkgver=2637
_gccver=16.2.0
pkgrel=1
pkgdesc="Static musl-based cross-compilation toolchains (binary)"
url="https://github.com/userdocs/musl-cross-make"
arch=(x86_64 aarch64)
depends=()
makedepends=()
options=('!strip' libtool staticlibs '!emptydirs')
license=(
    'MIT'
    'GPL-3.0-or-later WITH GPL-3.0-linking-exception'
    'GPL-3.0-or-later'
    'GPL-2.0-only WITH Linux-syscall-note'
    'LGPL-3.0-or-later'
)

source=(
  https://github.com/userdocs/musl-cross-make/raw/refs/heads/master/LICENSE
)

_url_x86_64="${url}/releases/download/${pkgver}/x86_64-"
source_x86_64=(
    ${_url_x86_64}aarch64-linux-musl.tar.xz
    ${_url_x86_64}arm-linux-musleabi.tar.xz
    ${_url_x86_64}arm-linux-musleabihf.tar.xz
    ${_url_x86_64}armv6-linux-musleabihf.tar.xz
    ${_url_x86_64}armv7l-linux-musleabihf.tar.xz
    ${_url_x86_64}i686-linux-musl.tar.xz
    ${_url_x86_64}loongarch64-linux-musl.tar.xz
    ${_url_x86_64}mips-linux-musl.tar.xz
    ${_url_x86_64}mips64-linux-musl.tar.xz
    ${_url_x86_64}mips64el-linux-musl.tar.xz
    ${_url_x86_64}mipsel-linux-musl.tar.xz
    ${_url_x86_64}powerpc-linux-musl.tar.xz
    ${_url_x86_64}powerpc64le-linux-musl.tar.xz
    ${_url_x86_64}riscv64-linux-musl.tar.xz
    ${_url_x86_64}s390x-linux-musl.tar.xz
    ${_url_x86_64}x86_64-linux-musl.tar.xz
)

_url_aarch64="${url}/releases/download/${pkgver}/aarch64-"
source_aarch64=(
    ${_url_aarch64}aarch64-linux-musl.tar.xz
    ${_url_aarch64}arm-linux-musleabi.tar.xz
    ${_url_aarch64}arm-linux-musleabihf.tar.xz
    ${_url_aarch64}armv6-linux-musleabihf.tar.xz
    ${_url_aarch64}armv7l-linux-musleabihf.tar.xz
    ${_url_aarch64}i686-linux-musl.tar.xz
    ${_url_aarch64}loongarch64-linux-musl.tar.xz
    ${_url_aarch64}mips-linux-musl.tar.xz
    ${_url_aarch64}mips64-linux-musl.tar.xz
    ${_url_aarch64}mips64el-linux-musl.tar.xz
    ${_url_aarch64}mipsel-linux-musl.tar.xz
    ${_url_aarch64}powerpc-linux-musl.tar.xz
    ${_url_aarch64}powerpc64le-linux-musl.tar.xz
    ${_url_aarch64}riscv64-linux-musl.tar.xz
    ${_url_aarch64}s390x-linux-musl.tar.xz
    ${_url_aarch64}x86_64-linux-musl.tar.xz
)

package_aarch64-linux-musl-bin() {
  pkgdesc="Static ${pkgname%-bin} cross-compilation toolchain (binary)"
  provides=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  conflicts=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  install -dm755 "${pkgdir}/usr/lib/musl-cross"
  cp -r ${pkgname%-bin} "${pkgdir}/usr/lib/musl-cross"
  rm -f "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man/man1/{mold,ld.mold}.1
  install -dm755 "${pkgdir}/usr/share/man"
  cp -r ${pkgname%-bin}/share/man/man1 "${pkgdir}/usr/share/man"
  rm -f "${pkgdir}"/usr/share/man/man1/{mold,ld.mold}.1
  rm -fr "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man
  install -dm755 "${pkgdir}/usr/bin"
  for bin in addr2line ar as c++ cc c++filt cpp elfedit g++ gcc gcc-${_gccver} gcc-ar gcc-nm gcc-ranlib gcov gcov-dump gcov-tool gprof ld ld.bfd ld.mold lto-dump nm objcopy ranlib readelf size strings strip; do
    ln -sfT ../lib/musl-cross/${pkgname%-bin}/bin/${pkgname%-bin}-${bin} "$pkgdir/usr/bin/${pkgname%-bin}-${bin}"
  done
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_arm-linux-musleabi-bin() {
  pkgdesc="Static ${pkgname%-bin} cross-compilation toolchain (binary)"
  provides=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  conflicts=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  install -dm755 "${pkgdir}/usr/lib/musl-cross"
  cp -r ${pkgname%-bin} "${pkgdir}/usr/lib/musl-cross"
  rm -f "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man/man1/{mold,ld.mold}.1
  install -dm755 "${pkgdir}/usr/share/man"
  cp -r ${pkgname%-bin}/share/man/man1 "${pkgdir}/usr/share/man"
  rm -f "${pkgdir}"/usr/share/man/man1/{mold,ld.mold}.1
  rm -fr "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man
  install -dm755 "${pkgdir}/usr/bin"
  for bin in addr2line ar as c++ cc c++filt cpp elfedit g++ gcc gcc-${_gccver} gcc-ar gcc-nm gcc-ranlib gcov gcov-dump gcov-tool gprof ld ld.bfd ld.mold lto-dump nm objcopy ranlib readelf size strings strip; do
    ln -sfT ../lib/musl-cross/${pkgname%-bin}/bin/${pkgname%-bin}-${bin} "$pkgdir/usr/bin/${pkgname%-bin}-${bin}"
  done
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_arm-linux-musleabihf-bin() {
  pkgdesc="Static ${pkgname%-bin} cross-compilation toolchain (binary)"
  provides=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  conflicts=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  install -dm755 "${pkgdir}/usr/lib/musl-cross"
  cp -r ${pkgname%-bin} "${pkgdir}/usr/lib/musl-cross"
  rm -f "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man/man1/{mold,ld.mold}.1
  install -dm755 "${pkgdir}/usr/share/man"
  cp -r ${pkgname%-bin}/share/man/man1 "${pkgdir}/usr/share/man"
  rm -f "${pkgdir}"/usr/share/man/man1/{mold,ld.mold}.1
  rm -fr "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man
  install -dm755 "${pkgdir}/usr/bin"
  for bin in addr2line ar as c++ cc c++filt cpp elfedit g++ gcc gcc-${_gccver} gcc-ar gcc-nm gcc-ranlib gcov gcov-dump gcov-tool gprof ld ld.bfd ld.mold lto-dump nm objcopy ranlib readelf size strings strip; do
    ln -sfT ../lib/musl-cross/${pkgname%-bin}/bin/${pkgname%-bin}-${bin} "$pkgdir/usr/bin/${pkgname%-bin}-${bin}"
  done
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_armv6-linux-musleabihf-bin() {
  pkgdesc="Static ${pkgname%-bin} cross-compilation toolchain (binary)"
  provides=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  conflicts=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  install -dm755 "${pkgdir}/usr/lib/musl-cross"
  cp -r ${pkgname%-bin} "${pkgdir}/usr/lib/musl-cross"
  rm -f "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man/man1/{mold,ld.mold}.1
  install -dm755 "${pkgdir}/usr/share/man"
  cp -r ${pkgname%-bin}/share/man/man1 "${pkgdir}/usr/share/man"
  rm -f "${pkgdir}"/usr/share/man/man1/{mold,ld.mold}.1
  rm -fr "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man
  install -dm755 "${pkgdir}/usr/bin"
  for bin in addr2line ar as c++ cc c++filt cpp elfedit g++ gcc gcc-${_gccver} gcc-ar gcc-nm gcc-ranlib gcov gcov-dump gcov-tool gprof ld ld.bfd ld.mold lto-dump nm objcopy ranlib readelf size strings strip; do
    ln -sfT ../lib/musl-cross/${pkgname%-bin}/bin/${pkgname%-bin}-${bin} "$pkgdir/usr/bin/${pkgname%-bin}-${bin}"
  done
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_armv7l-linux-musleabihf-bin() {
  pkgdesc="Static ${pkgname%-bin} cross-compilation toolchain (binary)"
  provides=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  conflicts=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  install -dm755 "${pkgdir}/usr/lib/musl-cross"
  cp -r ${pkgname%-bin} "${pkgdir}/usr/lib/musl-cross"
  rm -f "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man/man1/{mold,ld.mold}.1
  install -dm755 "${pkgdir}/usr/share/man"
  cp -r ${pkgname%-bin}/share/man/man1 "${pkgdir}/usr/share/man"
  rm -f "${pkgdir}"/usr/share/man/man1/{mold,ld.mold}.1
  rm -fr "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man
  install -dm755 "${pkgdir}/usr/bin"
  for bin in addr2line ar as c++ cc c++filt cpp elfedit g++ gcc gcc-${_gccver} gcc-ar gcc-nm gcc-ranlib gcov gcov-dump gcov-tool gprof ld ld.bfd ld.mold lto-dump nm objcopy ranlib readelf size strings strip; do
    ln -sfT ../lib/musl-cross/${pkgname%-bin}/bin/${pkgname%-bin}-${bin} "$pkgdir/usr/bin/${pkgname%-bin}-${bin}"
  done
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_i686-linux-musl-bin() {
  pkgdesc="Static ${pkgname%-bin} cross-compilation toolchain (binary)"
  provides=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  conflicts=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  install -dm755 "${pkgdir}/usr/lib/musl-cross"
  cp -r ${pkgname%-bin} "${pkgdir}/usr/lib/musl-cross"
  rm -f "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man/man1/{mold,ld.mold}.1
  install -dm755 "${pkgdir}/usr/share/man"
  cp -r ${pkgname%-bin}/share/man/man1 "${pkgdir}/usr/share/man"
  rm -f "${pkgdir}"/usr/share/man/man1/{mold,ld.mold}.1
  rm -fr "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man
  install -dm755 "${pkgdir}/usr/bin"
  for bin in addr2line ar as c++ cc c++filt cpp elfedit g++ gcc gcc-${_gccver} gcc-ar gcc-nm gcc-ranlib gcov gcov-dump gcov-tool gprof ld ld.bfd ld.mold lto-dump nm objcopy ranlib readelf size strings strip; do
    ln -sfT ../lib/musl-cross/${pkgname%-bin}/bin/${pkgname%-bin}-${bin} "$pkgdir/usr/bin/${pkgname%-bin}-${bin}"
  done
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_loongarch64-linux-musl-bin() {
  pkgdesc="Static ${pkgname%-bin} cross-compilation toolchain (binary)"
  provides=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  conflicts=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  install -dm755 "${pkgdir}/usr/lib/musl-cross"
  cp -r ${pkgname%-bin} "${pkgdir}/usr/lib/musl-cross"
  rm -f "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man/man1/{mold,ld.mold}.1
  install -dm755 "${pkgdir}/usr/share/man"
  cp -r ${pkgname%-bin}/share/man/man1 "${pkgdir}/usr/share/man"
  rm -f "${pkgdir}"/usr/share/man/man1/{mold,ld.mold}.1
  rm -fr "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man
  install -dm755 "${pkgdir}/usr/bin"
  for bin in addr2line ar as c++ cc c++filt cpp elfedit g++ gcc gcc-${_gccver} gcc-ar gcc-nm gcc-ranlib gcov gcov-dump gcov-tool gprof ld ld.bfd ld.mold lto-dump nm objcopy ranlib readelf size strings strip; do
    ln -sfT ../lib/musl-cross/${pkgname%-bin}/bin/${pkgname%-bin}-${bin} "$pkgdir/usr/bin/${pkgname%-bin}-${bin}"
  done
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_mips-linux-musl-bin() {
  pkgdesc="Static ${pkgname%-bin} cross-compilation toolchain (binary)"
  provides=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  conflicts=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  install -dm755 "${pkgdir}/usr/lib/musl-cross"
  cp -r ${pkgname%-bin} "${pkgdir}/usr/lib/musl-cross"
  rm -f "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man/man1/{mold,ld.mold}.1
  install -dm755 "${pkgdir}/usr/share/man"
  cp -r ${pkgname%-bin}/share/man/man1 "${pkgdir}/usr/share/man"
  rm -f "${pkgdir}"/usr/share/man/man1/{mold,ld.mold}.1
  rm -fr "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man
  install -dm755 "${pkgdir}/usr/bin"
  for bin in addr2line ar as c++ cc c++filt cpp elfedit g++ gcc gcc-${_gccver} gcc-ar gcc-nm gcc-ranlib gcov gcov-dump gcov-tool gprof ld ld.bfd ld.mold lto-dump nm objcopy ranlib readelf size strings strip; do
    ln -sfT ../lib/musl-cross/${pkgname%-bin}/bin/${pkgname%-bin}-${bin} "$pkgdir/usr/bin/${pkgname%-bin}-${bin}"
  done
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_mips64-linux-musl-bin() {
  pkgdesc="Static ${pkgname%-bin} cross-compilation toolchain (binary)"
  provides=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  conflicts=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  install -dm755 "${pkgdir}/usr/lib/musl-cross"
  cp -r ${pkgname%-bin} "${pkgdir}/usr/lib/musl-cross"
  rm -f "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man/man1/{mold,ld.mold}.1
  install -dm755 "${pkgdir}/usr/share/man"
  cp -r ${pkgname%-bin}/share/man/man1 "${pkgdir}/usr/share/man"
  rm -f "${pkgdir}"/usr/share/man/man1/{mold,ld.mold}.1
  rm -fr "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man
  install -dm755 "${pkgdir}/usr/bin"
  for bin in addr2line ar as c++ cc c++filt cpp elfedit g++ gcc gcc-${_gccver} gcc-ar gcc-nm gcc-ranlib gcov gcov-dump gcov-tool gprof ld ld.bfd ld.mold lto-dump nm objcopy ranlib readelf size strings strip; do
    ln -sfT ../lib/musl-cross/${pkgname%-bin}/bin/${pkgname%-bin}-${bin} "$pkgdir/usr/bin/${pkgname%-bin}-${bin}"
  done
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_mips64el-linux-musl-bin() {
  pkgdesc="Static ${pkgname%-bin} cross-compilation toolchain (binary)"
  provides=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  conflicts=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  install -dm755 "${pkgdir}/usr/lib/musl-cross"
  cp -r ${pkgname%-bin} "${pkgdir}/usr/lib/musl-cross"
  rm -f "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man/man1/{mold,ld.mold}.1
  install -dm755 "${pkgdir}/usr/share/man"
  cp -r ${pkgname%-bin}/share/man/man1 "${pkgdir}/usr/share/man"
  rm -f "${pkgdir}"/usr/share/man/man1/{mold,ld.mold}.1
  rm -fr "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man
  install -dm755 "${pkgdir}/usr/bin"
  for bin in addr2line ar as c++ cc c++filt cpp elfedit g++ gcc gcc-${_gccver} gcc-ar gcc-nm gcc-ranlib gcov gcov-dump gcov-tool gprof ld ld.bfd ld.mold lto-dump nm objcopy ranlib readelf size strings strip; do
    ln -sfT ../lib/musl-cross/${pkgname%-bin}/bin/${pkgname%-bin}-${bin} "$pkgdir/usr/bin/${pkgname%-bin}-${bin}"
  done
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_mipsel-linux-musl-bin() {
  pkgdesc="Static ${pkgname%-bin} cross-compilation toolchain (binary)"
  provides=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  conflicts=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  install -dm755 "${pkgdir}/usr/lib/musl-cross"
  cp -r ${pkgname%-bin} "${pkgdir}/usr/lib/musl-cross"
  rm -f "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man/man1/{mold,ld.mold}.1
  install -dm755 "${pkgdir}/usr/share/man"
  cp -r ${pkgname%-bin}/share/man/man1 "${pkgdir}/usr/share/man"
  rm -f "${pkgdir}"/usr/share/man/man1/{mold,ld.mold}.1
  rm -fr "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man
  install -dm755 "${pkgdir}/usr/bin"
  for bin in addr2line ar as c++ cc c++filt cpp elfedit g++ gcc gcc-${_gccver} gcc-ar gcc-nm gcc-ranlib gcov gcov-dump gcov-tool gprof ld ld.bfd ld.mold lto-dump nm objcopy ranlib readelf size strings strip; do
    ln -sfT ../lib/musl-cross/${pkgname%-bin}/bin/${pkgname%-bin}-${bin} "$pkgdir/usr/bin/${pkgname%-bin}-${bin}"
  done
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_powerpc-linux-musl-bin() {
  pkgdesc="Static ${pkgname%-bin} cross-compilation toolchain (binary)"
  provides=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  conflicts=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  install -dm755 "${pkgdir}/usr/lib/musl-cross"
  cp -r ${pkgname%-bin} "${pkgdir}/usr/lib/musl-cross"
  rm -f "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man/man1/{mold,ld.mold}.1
  install -dm755 "${pkgdir}/usr/share/man"
  cp -r ${pkgname%-bin}/share/man/man1 "${pkgdir}/usr/share/man"
  rm -f "${pkgdir}"/usr/share/man/man1/{mold,ld.mold}.1
  rm -fr "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man
  install -dm755 "${pkgdir}/usr/bin"
  for bin in addr2line ar as c++ cc c++filt cpp elfedit g++ gcc gcc-${_gccver} gcc-ar gcc-nm gcc-ranlib gcov gcov-dump gcov-tool gprof ld ld.bfd ld.mold lto-dump nm objcopy ranlib readelf size strings strip; do
    ln -sfT ../lib/musl-cross/${pkgname%-bin}/bin/${pkgname%-bin}-${bin} "$pkgdir/usr/bin/${pkgname%-bin}-${bin}"
  done
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_powerpc64le-linux-musl-bin() {
  pkgdesc="Static ${pkgname%-bin} cross-compilation toolchain (binary)"
  provides=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  conflicts=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  install -dm755 "${pkgdir}/usr/lib/musl-cross"
  cp -r ${pkgname%-bin} "${pkgdir}/usr/lib/musl-cross"
  rm -f "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man/man1/{mold,ld.mold}.1
  install -dm755 "${pkgdir}/usr/share/man"
  cp -r ${pkgname%-bin}/share/man/man1 "${pkgdir}/usr/share/man"
  rm -f "${pkgdir}"/usr/share/man/man1/{mold,ld.mold}.1
  rm -fr "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man
  install -dm755 "${pkgdir}/usr/bin"
  for bin in addr2line ar as c++ cc c++filt cpp elfedit g++ gcc gcc-${_gccver} gcc-ar gcc-nm gcc-ranlib gcov gcov-dump gcov-tool gprof ld ld.bfd ld.mold lto-dump nm objcopy ranlib readelf size strings strip; do
    ln -sfT ../lib/musl-cross/${pkgname%-bin}/bin/${pkgname%-bin}-${bin} "$pkgdir/usr/bin/${pkgname%-bin}-${bin}"
  done
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_riscv64-linux-musl-bin() {
  pkgdesc="Static ${pkgname%-bin} cross-compilation toolchain (binary)"
  provides=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  conflicts=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  install -dm755 "${pkgdir}/usr/lib/musl-cross"
  cp -r ${pkgname%-bin} "${pkgdir}/usr/lib/musl-cross"
  rm -f "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man/man1/{mold,ld.mold}.1
  install -dm755 "${pkgdir}/usr/share/man"
  cp -r ${pkgname%-bin}/share/man/man1 "${pkgdir}/usr/share/man"
  rm -f "${pkgdir}"/usr/share/man/man1/{mold,ld.mold}.1
  rm -fr "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man
  install -dm755 "${pkgdir}/usr/bin"
  for bin in addr2line ar as c++ cc c++filt cpp elfedit g++ gcc gcc-${_gccver} gcc-ar gcc-nm gcc-ranlib gcov gcov-dump gcov-tool gprof ld ld.bfd ld.mold lto-dump nm objcopy ranlib readelf size strings strip; do
    ln -sfT ../lib/musl-cross/${pkgname%-bin}/bin/${pkgname%-bin}-${bin} "$pkgdir/usr/bin/${pkgname%-bin}-${bin}"
  done
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_s390x-linux-musl-bin() {
  pkgdesc="Static ${pkgname%-bin} cross-compilation toolchain (binary)"
  provides=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  conflicts=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  install -dm755 "${pkgdir}/usr/lib/musl-cross"
  cp -r ${pkgname%-bin} "${pkgdir}/usr/lib/musl-cross"
  rm -f "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man/man1/{mold,ld.mold}.1
  install -dm755 "${pkgdir}/usr/share/man"
  cp -r ${pkgname%-bin}/share/man/man1 "${pkgdir}/usr/share/man"
  rm -f "${pkgdir}"/usr/share/man/man1/{mold,ld.mold}.1
  rm -fr "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man
  install -dm755 "${pkgdir}/usr/bin"
  for bin in addr2line ar as c++ cc c++filt cpp elfedit g++ gcc gcc-${_gccver} gcc-ar gcc-nm gcc-ranlib gcov gcov-dump gcov-tool gprof ld ld.bfd ld.mold lto-dump nm objcopy ranlib readelf size strings strip; do
    ln -sfT ../lib/musl-cross/${pkgname%-bin}/bin/${pkgname%-bin}-${bin} "$pkgdir/usr/bin/${pkgname%-bin}-${bin}"
  done
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_x86_64-linux-musl-bin() {
  pkgdesc="Static ${pkgname%-bin} cross-compilation toolchain (binary)"
  provides=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  conflicts=(${pkgname%-bin} ${pkgname%-bin}-cross ${pkgname%-bin}-cross-bin)
  install -dm755 "${pkgdir}/usr/lib/musl-cross"
  cp -r ${pkgname%-bin} "${pkgdir}/usr/lib/musl-cross"
  rm -f "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man/man1/{mold,ld.mold}.1
  install -dm755 "${pkgdir}/usr/share/man"
  cp -r ${pkgname%-bin}/share/man/man1 "${pkgdir}/usr/share/man"
  rm -f "${pkgdir}"/usr/share/man/man1/{mold,ld.mold}.1
  rm -fr "${pkgdir}"/usr/lib/musl-cross/${pkgname%-bin}/share/man
  install -dm755 "${pkgdir}/usr/bin"
  for bin in addr2line ar as c++ cc c++filt cpp elfedit g++ gcc gcc-${_gccver} gcc-ar gcc-nm gcc-ranlib gcov gcov-dump gcov-tool gprof ld ld.bfd ld.mold lto-dump nm objcopy ranlib readelf size strings strip; do
    ln -sfT ../lib/musl-cross/${pkgname%-bin}/bin/${pkgname%-bin}-${bin} "$pkgdir/usr/bin/${pkgname%-bin}-${bin}"
  done
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

sha256sums=('6512d6cdd05bb1e71491518b8b2ffe14927bdc13c21dd205c653ba65f7b7c72c')
sha256sums_x86_64=('1248c582a35159e0e06659682a6792c4dc0dd124fe340cf0d2032f22b50492bb'
                   '281658cdcc6dca768b19102469afe2788d34c476fedfb7cc3f9788f35a3e9edc'
                   '04b151b7397fbbc82fd642a9f3961d3603f58afc2ceda2ddc75e739b79972f3b'
                   '4e1fe658c117e4746a01fe677a0d38a0e13f25617e4944a05b6664c9ac0958d6'
                   '33b14498c26ffed779e5ab9a5dac6be92731adcab2e77b1b2549e8194d083432'
                   'c15abd67c5eccfc9d708c7cf14be9a4c3a5dfabd34b8b05643f9ff4123ed1910'
                   'ab4f5f9fbdce8e6b99153ecf3c6128c76955d1743c7d7bb06d5e79c9035cf50f'
                   'bdd8a1ab2b777b55f121fddf361e6894f4be89139066b19c92aaaa8547341798'
                   '1f97393a97d5856773cd313bcd771f57be5226fa870bdb2e7469571a222b9e9f'
                   '59a328d2f9ced32ea5734aa22deaa7ab45d399733a7d59b576a0246370fbef4e'
                   '31712aade54023748223392c48dcae7b53ce2a8a5282577ddae2727e54f490b7'
                   'ad61485a4cb59eed7b33f87a039c8b7c97249dec0e9905ad4e4395a0a28d6af1'
                   'caad88fda1ed72cfef5046f9dbf10a56d6a368fb41a4e26d212c7442bdeecbe2'
                   'cd025f324995448894443d8fa7de4a353d60b013f4a9ce0656f56875135f3b6c'
                   '003a5133578b9394b3be94dab3379a158e3f95408e2c70e6a64698d49b004384'
                   '1734929e1ee637a09235bfc8efd03390e95e8cca87e99e7b2cb2efd1650c9fd1')
sha256sums_aarch64=('6455090978636b0841b88c51b3d3e844063689893815e1de271bc72beb09a95b'
                    '4c5fccba42b73d1b5a401fb44801ff3576bbf6119076ad07ec8576aab3b9e8ff'
                    '613ecf2872f898242469ae8d8adc932d950937e8c40b44883e65ea4b7115407b'
                    'eddeed1fb7e6d2eafd74b11415067f5d49babff0ee6ced51b83ec455a623e1da'
                    'faae56e2e269da5ee7bc89a5cf9c21afbf5d60385fb702ad41739a3253ba370f'
                    '2a9410fd86107843724895574c26f018820870387fb12c16ee4199aabb0149cc'
                    '7d939b24941ac96d0907c3045cc424d65b528a2cc998f195f4757158ae41f7bc'
                    '1e879eeddc05f7b123ac3f030904343a7a0beb10c5f157321c44c38f4021750c'
                    '31b94d4a8caa0db8654033576c3620396a3328e904a85063cf6dbebf363df446'
                    'e1c8271213d68150a7e184fde257260d7f619df50e27a8ac7a32ce24f089b77b'
                    'cd7ae4148433b65d6ff3ed160f032014d1cf6b9db7d6f7a2c9933b82bd240492'
                    '69f301d9ca3d32038c56539f199efa3005d83e44cf6c52f275faf942a61b92fa'
                    '65eae676c66a672f469aa435af99fe9413f07e91247d0f1b2116662c1c1a6db6'
                    '737a740c7fac84ffab7c9878147696fe548c3a44a7083b40bc380b8f8e63f174'
                    'b6a747256af9b363bf9d5483f28dc23ffa0f7b7d347edf468405f6302e860de2'
                    '0c227cfe895e6e16f4c3395c744e3f8d5d34c7210839602fc81707e2c286904d')
