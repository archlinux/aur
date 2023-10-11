#
# PKGBUILD for codelite-unstable
#
# codelite-unstable package follows the weekly/latest builds of codelite - based on officially published tags
#
# The naming codelite-unstable is deliberately used to indicate that this package is not based the official stable release
#
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#
# ChangeLogUrl: https://wiki.codelite.org/pmwiki.php/Main/ReleaseNotesCodeLite15
#
# NOTES:
#
#

#
_pkg_user="eranif"
_pkg_name="codelite"
_pkg_ver="17.7.0"
#_commit="16470d74c038b5c5c17756e78bd04ae6e00c2007"


# dtl submodule: https://github.com/cubicdaiya/dtl
_dtl_pkg_user="cubicdaiya"
_dtl_pkg_name="dtl"
_dtl_pkg_ident="cd45dd48089c6e9f7a595d920ddfb82c08d59150"
_dtl_pkg_name_ident="${_dtl_pkg_user}-${_dtl_pkg_name}-${_dtl_pkg_ident:0:7}"

# ccwrap submodule: https://github.com/eranif/cc-wrapper
_ccwrap_pkg_user="${_pkg_user}"
_ccwrap_pkg_name="cc-wrapper"
_ccwrap_pkg_ident="67713440e867493e74ce5c7ce0352b81eb4b726b"
_ccwrap_pkg_name_ident="${_ccwrap_pkg_user}-${_ccwrap_pkg_name}-${_ccwrap_pkg_ident:0:7}"

# ctags submodule: https://github.com/eranif/ctags
_ctags_pkg_user="${_pkg_user}"
_ctags_pkg_name="ctags"
_ctags_pkg_ident="3e173d8d82fd2d3534feff0d822d6de36ca3d74e"
_ctags_pkg_name_ident="${_ctags_pkg_user}-${_ctags_pkg_name}-${_ctags_pkg_ident:0:7}"

# wxcfg/wx-config-msys2s submodule: https://github.com/eranif/wx-config-msys2.git
_wxcfg_pkg_user="${_pkg_user}"
_wxcfg_pkg_name="wx-config-msys2"
_wxcfg_pkg_ident="fe65daf2a49e2a1f218ea3106a26d5ae7c4235fb"
_wxcfg_pkg_name_ident="${_wxcfg_pkg_user}-${_wxcfg_pkg_name}-${_wxcfg_pkg_ident:0:7}"

# wxdap/wxdap submodule: https://github.com/eranif/wxdap
_wxdap_pkg_user="${_pkg_user}"
_wxdap_pkg_name="wxdap"
_wxdap_pkg_ident="e5c7d35f17ca119aa99710244c0764b07f0cc4c6"
_wxdap_pkg_name_ident="${_wxdap_pkg_user}-${_wxdap_pkg_name}-${_wxdap_pkg_ident:0:7}"

# yaml-cpp submodule: https://github.com/jbeder/yaml-cpp
_yaml_pkg_user="jbeder"
_yaml_pkg_name="yaml-cpp"
_yaml_pkg_ident="1b50109f7bea60bd382d8ea7befce3d2bd67da5f"
_yaml_pkg_name_ident="${_yaml_pkg_user}-${_yaml_pkg_name}-${_yaml_pkg_ident:0:7}"

# tinyjson sub-submodule: https://github.com/eranif/tinyjson
_json_pkg_user="${_pkg_user}"
_json_pkg_name="tinyjson"
_json_pkg_ident="a6b0d0d31a05a9f55b4944b3b20f769305eb583a"
_json_pkg_name_ident="${_json_pkg_user}-${_json_pkg_name}-${_json_pkg_ident:0:7}"


# pkg
pkgname="${_pkg_name}-unstable"
#pkgver=${_pkg_ver}
#pkgver="${_pkg_ver//_/-}"
pkgver="${_pkg_ver/-*/}"
pkgrel=1

# generic: pre
_pkg_ver="${pkgver}"

# use version
_pkg_ident="${pkgver}"

# use commit
#_pkg_ident="${_commit}"

# generic: post
_pkg_name_ver="${_pkg_name}-${_pkg_ident}"
_pkg_name_ident="${_pkg_name}-${_pkg_ident}"


#
pkgdesc="Cross platform IDE for C, C++, Rust, Python, PHP and Node.js written in C++"
arch=('i686' 'x86_64' 'aarch64')
url="https://codelite.org/"
license=('GPL')

makedepends=('pkgconfig' 'cmake' 'ninja' 'clang')

depends=(
    'wxwidgets-gtk3'
    'libedit'
    'libssh'
    'mariadb-libs'
    'ncurses'
    'uchardet'
    'hunspell'
    #'ctags'
    #'xterm'
    #'wget'
    #'curl'
    #'python'
    #'python2'
)

optdepends=(
    'clang: compiler'
    'lldb: debugger'
    'gcc: compiler'
    'gdb: debugger'
    'valgrind: debugger'
    'rust: language'
    'php: language'
    'graphviz: callgraph visualization'
    'cscope: CScope Integration for CodeLite'
)

provides=('codelite')

conflicts=('codelite')

source=(
    "${_pkg_name_ident}.tar.gz::https://github.com/${_pkg_user}/${_pkg_name}/archive/${_pkg_ident}.tar.gz"
    "${_dtl_pkg_name_ident}.tar.gz::https://github.com/${_dtl_pkg_user}/${_dtl_pkg_name}/tarball/${_dtl_pkg_ident}"
    "${_ccwrap_pkg_name_ident}.tar.gz::https://github.com/${_ccwrap_pkg_user}/${_ccwrap_pkg_name}/tarball/${_ccwrap_pkg_ident}"
    "${_json_pkg_name_ident}.tar.gz::https://github.com/${_json_pkg_user}/${_json_pkg_name}/tarball/${_json_pkg_ident}"
    "${_ctags_pkg_name_ident}.tar.gz::https://github.com/${_ctags_pkg_user}/${_ctags_pkg_name}/tarball/${_ctags_pkg_ident}"
    "${_wxcfg_pkg_name_ident}.tar.gz::https://github.com/${_wxcfg_pkg_user}/${_wxcfg_pkg_name}/tarball/${_wxcfg_pkg_ident}"
    "${_wxdap_pkg_name_ident}.tar.gz::https://github.com/${_wxdap_pkg_user}/${_wxdap_pkg_name}/tarball/${_wxdap_pkg_ident}"
    "${_yaml_pkg_name_ident}.tar.gz::https://github.com/${_yaml_pkg_user}/${_yaml_pkg_name}/tarball/${_yaml_pkg_ident}"
    "http://repos.codelite.org/wxCrafterLibs/wxgui.zip"
  )

sha256sums=('7e78d711200b3227fdbb44cb0eb269dac0d32b3b350c4adf9e6a71660820eb4d'
            '507adbaf9776f9f99f39e563876a6a5633eaa0c512f6b9b55c711037165413e4'
            '9343c1f05956308c7f3c4b6ad33d68c08d95ef0ffcdce0ec6c883ccd21bd5f71'
            'ff539f3e2ee4c52073e8b73fd8046163d68b0db567ce7ea5b9438424dc3a2253'
            'aa48f2744a85c34fbaae845eecbc8862e453b8b754fec63938fc5ceef6c26189'
            '70aca36b95e2245740c17fc9a164fd6edabfd9c631184ea66cc5ee03ff54c028'
            '677396ec607422c10e69ecf34281047b37a17be7006ab871c1df7d230a5c5abb'
            '57f06c89f41cc2cd250b8b1db582fe27a0da67eb7a480cd8eb3d35cde64b58cd'
            '498c39ad3cc46eab8232d5fa37627c27a27f843cbe9521f05f29b19def436e12')

noextract=('wxgui.zip')

#
#
#

#if [[ "$CARCH" == 'i686' ]]; then
#  source+=(http://repos.codelite.org/wxCrafterLibs/ArchLinux/32/wxCrafter.so)
#  md5sums+=('cd3e71e8187ce586031df070caed6c85')
#elif [[ "$CARCH" == 'x86_64' ]]; then
#  source+=(http://repos.codelite.org/wxCrafterLibs/ArchLinux/64/wxCrafter.so)
#  md5sums+=('6fcd2f0fada5fc401d0bcd62cd5452bb')
#fi


BUILD_DIR="_build"

#
#
#
prepare()
{
  cd "${srcdir}/${_pkg_name_ident}"

  # submodule cubicdaiya-dtl
  rmdir dtl
  ln -s ../${_dtl_pkg_name_ident} dtl

  # submodule eranif-cc-wrapper
  rmdir cc-wrapper
  ln -s ../${_ccwrap_pkg_name_ident} cc-wrapper

  # sub-submodule eranif-tinyjson
  test -d tinyjson && rmdir tinyjson
  test -h tinyjson && rm -f tinyjson
  ln -s ../${_json_pkg_name_ident} tinyjson
  #
  rmdir cc-wrapper/tinyjson
  #ln -s ../tinyjson cc-wrapper/tinyjson
  ln -s ../${_json_pkg_name_ident} cc-wrapper/tinyjson

  # submodule eranif-ctags
  rmdir ctags
  ln -s ../${_ctags_pkg_name_ident} ctags

  # submodule eranif-wxdap to wxdap
  rmdir wxdap
  ln -s ../${_wxdap_pkg_name_ident} wxdap

  # submodule eranif-wx-config-msys2 to wx-config-msys2
  rmdir wx-config-msys2
  ln -s ../${_wxcfg_pkg_name_ident} wx-config-msys2

  # submodule jbeder/yaml-cpp
  rmdir yaml-cpp
  ln -s ../${_yaml_pkg_name_ident} yaml-cpp

  # apply patches

  #patch -p0 < "${startdir}/codelite-fsw-symlink.patch"
  #patch -p0 < "${startdir}/codelite-linux-on-sigpipe.patch"
  #patch -p0 < "${startdir}/codelite-DebugAdapterClient-CMakeLists-cxx17.patch"
  #patch -p0 < "${startdir}/codelite-quickfindbar-focus-tweak.patch"
  #patch -p0 < "${startdir}/cmake.patch"  # wx-config patch

  # temporary disable wxcrafter build: cl-16.1.0/wxcrafter subdir build fails with wx-3.1.7 - is this still a problem - re-test !!!
  #mv wxcrafter wxcrafter.disable
}


#
#
#
build()
{
cd "${srcdir}/${_pkg_name_ident}"

CXXFLAGS="${CXXFLAGS} -fno-devirtualize"
export CXXFLAGS

# cmake find_package() will try env var WX_CONFIG as wx-config tool path before checking its builtin hardcoded naming conbinations for wx-config tool
#WX_CONFIG="wx-config"
#WX_CONFIG="wx-config-gtk2"
#WX_CONFIG="wx-config-gtk3"
#WX_CONFIG="/opt/wxgtk-dev/bin/wx-config"
WX_CONFIG="wx-config"
export WX_CONFIG

mkdir -p "${BUILD_DIR}"
#cd "${BUILD_DIR}"

cmake -B "${BUILD_DIR}" -S . -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DWITH_PCH=0 -DWITH_WX_CONFIG=${WX_CONFIG} -DWITH_NATIVEBOOK=1 -DENABLE_LLDB=1 -DWITH_MYSQL=0 -DCMAKE_INSTALL_LIBDIR=lib
#-DCMAKE_INSTALL_RPATH=/opt/wxgtk-dev/lib

#make -C "${BUILD_DIR}"
cmake --build "${BUILD_DIR}"

}

#
#
#
package()
{
cd "${srcdir}/${_pkg_name_ident}"

#make -C "${BUILD_DIR}" -j1 DESTDIR="${pkgdir}" install
DESTDIR="${pkgdir}" cmake --install "${BUILD_DIR}"

install -m 644 -D "${srcdir}/${_pkg_name_ver}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkg_name}/LICENSE"
#install -m 755 -D "${srcdir}/wxCrafter.so" "${pkgdir}/usr/lib/codelite/wxCrafter.so"
#install -m 644 -D "${srcdir}/wxgui.zip" "${pkgdir}/usr/share/codelite/wxgui.zip"

# universal-ctags experiment
#mv "${pkgdir}/usr/bin/codelite-ctags" "${pkgdir}/usr/bin/codelite-ctags.dist"
#ln -s /usr/bin/ctags "${pkgdir}/usr/bin/codelite-ctags"

}

#
# EOF
#
