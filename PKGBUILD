# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_arch="mips"
_platform="ps2"
_iop="${_arch}el-${_platform}"
_ee="${_arch}64r5900el-${_platform}-elf"
_pkg="FreeMcBoot"
_base="sdk"
pkgname="freemcboot"
pkgver="v0.1"
pkgrel=1
_pkgdesc=("'Free MemoryCard Boot' "
          "for Sony Playstation® 2 videogame system.")
pkgdesc="${_pkgdesc[*]}"
arch=('x86_64')
license=('custom')
_license="${pkgname}"
_ns="TnA-Plastic"
_github="https://github.com/${_ns}"
_local="ssh://git@127.0.0.1:/home/git"
url="${_github}/${_pkg}"
makedepends=("${_platform}-${_base}")
optdepends=()
_commit="2e4eef9a1ec5612cde1121d185996fd08fecb930"
source=("${pkgname}::git+${url}#commit=${_commit}")
sha256sums=('SKIP')

_cflags=(-I"/usr/${_ee}/include/pthread-embedded")
         # -nostdinc
         # -I"/usr/${_ee}/include/newlib-nano")
         # -static)

_iop_incs=(-I"/usr/${_iop}/include"
           -I"/usr/include/${_platform}${_base}")

_ee_incs=(-I"/usr/${_ee}/include"
          -I"/usr/include/${_platform}${_base}")

_ldflags=(-L"/usr/${_ee}/lib/pthread-embedded"
          # -L"/usr/${_ee}/lib/newlib-nano"
          "/usr/${_ee}/lib/newlib-nano/libc_nano.a"
          "/usr/${_ee}/lib/newlib-nano/libm_nano.a"
          "/usr/${_ee}/lib/newlib-nano/libg_nano.a"
          "/usr/${_ee}/lib/newlib-nano/crt0.o")

_build_opts=(IOP_INCS="${_iop_incs[*]}"
             EE_CC="${_ee}-gcc"
             EE_INCS="${_ee_incs[*]}")
             # CFLAGS="${_cflags[*]}"
             # CPPFLAGS="${_cflags[*]}"
             # CXXFLAGS="${_cflags[*]}"
             # LDFLAGS="${_ldflags[*]}")


build() {
  export CFLAGS=""
  export CXXFLAGS=""
  export CPPFLAGS=""
  export LDLAGS=""
  export IOP_CC=""
  export EE_CC=""
  export EE_INCS=""

  # export C_INCLUDE_PATH="/usr/${_ee}/include/pthread-embedded"
  # export IOP_CFLAGS="${_cflags[*]}"
  # export IOP_LDFLAGS="${_cflags[*]}"
  # export EE_CFLAGS="${_cflags[*]}"
  # export CFLAGS="${_cflags[*]}"
  # export CPPFLAGS="${_cflags[*]}"
  # export CXXFLAGS="${_cflags[*]}"
  # export LDFLAGS="${_ldflags[*]}"
  # export PS2SDK="${pkgdir}/usr"
  # export IOP_TOOL_PREFIX="${_iop}-elf-"
  export IOP_INCS="${_iop_incs[*]}"
  export EE_CC="${_ee}-gcc"
  export EE_INCS="${_ee_incs[*]}"

  cd "${srcdir}/${pkgname}"
  ls
  # make clean
  # LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/${_ee}/lib/pthread-embedded" \
  # IOP_CFLAGS="${_cflags[*]}" \
  # EE_CFLAGS="${_cflags[*]}" \
  # CFLAGS="${_cflags[*]}" \
  # CPPFLAGS="${_cflags[*]}" \
  # CXXFLAGS="${_cflags[*]}" \
  # EE_LDLAGS="${_cflags[*]}" \
  # IOP_LDLAGS="${_cflags[*]}" \
  # LDFLAGS="${_ldflags[*]}" \
  IOP_INCS="${_iop_incs[*]}" \
  EE_CC="${_ee}-gcc" \
  EE_INCS="${_ee_incs[*]}" \
  make "${_build_opts[@]}" # build
}

# shellcheck disable=SC2154
package() {

  export CFLAGS=""
  export CXXFLAGS=""
  export CPPFLAGS=""
  export LDLAGS=""

  # export C_INCLUDE_PATH="/usr/${_ee}/include/pthread-embedded"
  # export IOP_CFLAGS="${_cflags[*]}"
  # export IOP_LDFLAGS="${_cflags[*]}"
  # export EE_CFLAGS="${_cflags[*]}"
  # export CFLAGS="${_cflags[*]}"
  # export CPPFLAGS="${_cflags[*]}"
  # export CXXFLAGS="${_cflags[*]}"
  # export LDFLAGS="${_ldflags[*]}"
  # export PS2SDK="${pkgdir}/usr"
  # export IOP_TOOL_PREFIX="${_iop}-elf-"

  cd "${srcdir}/${pkgname}"
  ls
  # make clean
  # LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/${_ee}/lib/pthread-embedded" \
  # IOP_CFLAGS="${_cflags[*]}" \
  # EE_CFLAGS="${_cflags[*]}" \
  # CFLAGS="${_cflags[*]}" \
  # CPPFLAGS="${_cflags[*]}" \
  # CXXFLAGS="${_cflags[*]}" \
  # EE_LDLAGS="${_cflags[*]}" \
  # IOP_LDLAGS="${_cflags[*]}" \
  # LDFLAGS="${_ldflags[*]}" \
  # make DESTDIR="${pkgname}" install
  # cd "${pkgdir}/usr"
  # ls
  # mv "ee" "${_ee}"
  # cp -r "iop" "${_iop}-elf"
  # mv "iop" "${_iop}-irx"
  # mkdir -p "share/${_pkgname}"
  # mv AUTHORS "share/${_pkgname}"
  # mv samples "share/${_pkgname}"
  # mv Defs.make "share/${_pkgname}"
  # mv CHANGELOG "share/${_pkgname}"
  # mv ID "share/${_pkgname}"
  # mv README.md "share/${_pkgname}"
  # mkdir -p "include"
  # mv "common/include" "include/${_pkgname}"
  # rmdir common
  # mkdir -p "share/licenses/${_pkgname}"
  # mv LICENSE "share/licenses/${_pkgname}"
}
