#
# PKGBUILD for codelite
#
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#
# ReleaseNotes: https://docs.codelite.org/release_notes/v18_0_0/
#
# Contributor: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: nem <nem@ikitten.co.uk>
# Contributor: agvares <agvares13@gmail.com>
# Contributor: p2k <Patrick.Schneider@uni-ulm.de>
# Contributor: Uffe Jakobsen <uffe@uffe.org>
#
# NOTES:
#
# 20200917: MySql dbsupport temporary disabled (-DWITH_MYSQL=0) because of problem with its include internal files (fix suggested here: https://bugs.archlinux.org/task/67896)
# 20191009: Apply cmake list hack to work around harfbuzz hb.h inclusion problem
# 20190409: Mariadb patch applied from https://aur.archlinux.org/packages/codelite/
# 20151027: ArchLinux clang/llvm-3.7: CommandLine Error: Option 'aarch64-reserve-x18' registered more than once
# 20151027: -DENABLE_LLDB=0: ArchLinux clang/llvm-3.7: CommandLine Error: Option 'aarch64-reserve-x18' registered more than once
# 20151027: sudo chmod 000 /usr/lib/codelite/LLDBDebugger.so
#

#
_pkg_user="eranif"
_pkg_name="codelite"
_pkg_ver="18.2.0"
#_commit="15aff6f1b7bac11572190407a533d83a59d12aee"

# pkg
pkgname="${_pkg_name}"
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


_pkg_src_res="${_pkg_name_ident}.tar.gz::https://github.com/${_pkg_user}/${_pkg_name}/archive/${_pkg_ident}.tar.gz"

#
# submodules
#

# b73dc1d2c0ecb9452a87c26544d7f71e24342df6 submodules/asio (asio-1-12-0-54-gb73dc1d2c)
# c20b71e742e99e4106fa6c522c5cdf412af25e6a submodules/assistant (remotes/upstream/HEAD-40-gc20b71e)
# fd1ac4f1791b403af1f7350b1195ac114f9b792b submodules/cJSON (v0.0.0~50^2^2~16)
# 67713440e867493e74ce5c7ce0352b81eb4b726b submodules/cc-wrapper (remotes/origin/HEAD)
# ac5c942b422ca6dc6cdbfd2a0c2d481af1f18f02 submodules/ctags (p6.1.20240728.0-2-gac5c942b4)
# 32567bb9ec704f09040fb1ed7431a3d967e3df03 submodules/dtl (v1.21)
# 1d9a9ca8841ac0cd591c95b162301d2502641901 submodules/hunspell (v1.7.2-92-g1d9a9ca)
# 8502988a5eb83fcd281ee5a38533a9f170e6b2bf submodules/lexilla (remotes/origin/HEAD)
# 854795c654eda518ed6de6c1ebb4e2107fcb2e73 submodules/libssh (libssh-0.11.1)
# 7042229f977ca801983116593b2bbd73ae7f2657 submodules/openssl-cmake (heads/v3)
# c6d7e295bf5a0ab9b5f896720cc1a0e0fdc397a7 submodules/websocketpp (0.3.0-395-gc6d7e29)
# 8bb3ad01d5cbdef8d8f749d85df9fcd24d90923c submodules/wx-config-msys2 (remotes/origin/HEAD)
# c5ee34742728f97fa30d0877b925b260466057ba submodules/wxdap (heads/master-21-gc5ee347)
# b5dc09a9b94b9955ef98111d0f311cb43f32f649 submodules/wxsf-code (heads/main-2-gb5dc09a)
# 2f86d13775d119edbb69af52e5f566fd65c6953b submodules/yaml-cpp (0.8.0-74-g2f86d13)
# 0f51fb4933fc9ce18199cb2554dacea8033e7fd3 submodules/zlib (v1.3.1-50-g0f51fb4)

# NOTE: these submodules are currenly only used by macos builds - ignore them for now:
#   submodules/hunspell,
#   submodules/libssh
#   submodules/openssl-cmake
#   submodules/zlib

# asio submodule: https://github.com/chriskohlhoff/asio.git
_asio_pkg_user="chriskohlhoff"
_asio_pkg_name="asio"
_asio_pkg_ident="b73dc1d2c0ecb9452a87c26544d7f71e24342df6"
_asio_pkg_name_ident="${_asio_pkg_user}-${_asio_pkg_name}-${_asio_pkg_ident:0:7}"
_asio_pkg_src_res="${_asio_pkg_name_ident}.tar.gz::https://github.com/${_asio_pkg_user}/${_asio_pkg_name}/tarball/${_asio_pkg_ident}"

# assistant submodule: ssh://github.com/eraniff/codelite-assistant.git
_assistant_pkg_user="${_pkg_user}"
_assistant_pkg_name="assistant"
_assistant_pkg_ident="c20b71e742e99e4106fa6c522c5cdf412af25e6a"
_assistant_pkg_name_ident="${_assistant_pkg_user}-${_assistant_pkg_name}-${_assistant_pkg_ident:0:7}"
_assistant_pkg_src_res="${_assistant_pkg_name_ident}.tar.gz::https://github.com/${_assistant_pkg_user}/${_assistant_pkg_name}/tarball/${_assistant_pkg_ident}"

# cjson submodule: https://github.com/DaveGamble/cJSON
_cjson_pkg_user="DaveGamble"
_cjson_pkg_name="cJSON"
_cjson_pkg_ident="fd1ac4f1791b403af1f7350b1195ac114f9b792b"
_cjson_pkg_name_ident="${_cjson_pkg_user}-${_cjson_pkg_name}-${_cjson_pkg_ident:0:7}"
_cjson_pkg_src_res="${_cjson_pkg_name_ident}.tar.gz::https://github.com/${_cjson_pkg_user}/${_cjson_pkg_name}/tarball/${_cjson_pkg_ident}"

# ccwrap submodule: https://github.com/eranif/cc-wrapper
_ccwrap_pkg_user="${_pkg_user}"
_ccwrap_pkg_name="cc-wrapper"
_ccwrap_pkg_ident="67713440e867493e74ce5c7ce0352b81eb4b726b"
_ccwrap_pkg_name_ident="${_ccwrap_pkg_user}-${_ccwrap_pkg_name}-${_ccwrap_pkg_ident:0:7}"
_ccwrap_pkg_src_res="${_ccwrap_pkg_name_ident}.tar.gz::https://github.com/${_ccwrap_pkg_user}/${_ccwrap_pkg_name}/tarball/${_ccwrap_pkg_ident}"


# ctags submodule: https://github.com/eranif/ctags
_ctags_pkg_user="${_pkg_user}"
_ctags_pkg_name="ctags"
_ctags_pkg_ident="ac5c942b422ca6dc6cdbfd2a0c2d481af1f18f02"
_ctags_pkg_name_ident="${_ctags_pkg_user}-${_ctags_pkg_name}-${_ctags_pkg_ident:0:7}"
_ctags_pkg_src_res="${_ctags_pkg_name_ident}.tar.gz::https://github.com/${_ctags_pkg_user}/${_ctags_pkg_name}/tarball/${_ctags_pkg_ident}"

# dtl submodule: https://github.com/cubicdaiya/dtl
_dtl_pkg_user="cubicdaiya"
_dtl_pkg_name="dtl"
_dtl_pkg_ident="32567bb9ec704f09040fb1ed7431a3d967e3df03"
_dtl_pkg_name_ident="${_dtl_pkg_user}-${_dtl_pkg_name}-${_dtl_pkg_ident:0:7}"
_dtl_pkg_src_res="${_dtl_pkg_name_ident}.tar.gz::https://github.com/${_dtl_pkg_user}/${_dtl_pkg_name}/tarball/${_dtl_pkg_ident}"

# lexilla submodule: https://github.com/eranif/lexilla.git
_lexilla_pkg_user="eranif"
_lexilla_pkg_name="lexilla"
_lexilla_pkg_ident="8502988a5eb83fcd281ee5a38533a9f170e6b2bf"
_lexilla_pkg_name_ident="${_lexilla_pkg_user}-${_lexilla_pkg_name}-${_lexilla_pkg_ident:0:7}"
_lexilla_pkg_src_res="${_lexilla_pkg_name_ident}.tar.gz::https://github.com/${_lexilla_pkg_user}/${_lexilla_pkg_name}/tarball/${_lexilla_pkg_ident}"

## llama.cpp submodule: https://github.com/ggerganov/llama.cpp.git
#_llama_pkg_user="ggerganov"
#_llama_pkg_name="llama.cpp"
#_llama_pkg_ident="c3776cacabce2ee35f172fb72be7a519752125fa"
#_llama_pkg_name_ident="${_llama_pkg_user}-${_llama_pkg_name}-${_llama_pkg_ident:0:7}"
#_llama_pkg_src_res="${_llama_pkg_name_ident}.tar.gz::https://github.com/${_llama_pkg_user}/${_llama_pkg_name}/tarball/${_llama_pkg_ident}"

# websocket submodule: https://github.com/zaphoyd/websocketpp.git
_wspp_pkg_user="zaphoyd"
_wspp_pkg_name="websocketpp"
_wspp_pkg_ident="c6d7e295bf5a0ab9b5f896720cc1a0e0fdc397a7"
_wspp_pkg_name_ident="${_wspp_pkg_user}-${_wspp_pkg_name}-${_wspp_pkg_ident:0:7}"
_wspp_pkg_src_res="${_wspp_pkg_name_ident}.tar.gz::https://github.com/${_wspp_pkg_user}/${_wspp_pkg_name}/tarball/${_wspp_pkg_ident}"

# wxcfg/wx-config-msys2s submodule: https://github.com/eranif/wx-config-msys2.git
_wxcfg_pkg_user="${_pkg_user}"
_wxcfg_pkg_name="wx-config-msys2"
_wxcfg_pkg_ident="8bb3ad01d5cbdef8d8f749d85df9fcd24d90923c"
_wxcfg_pkg_name_ident="${_wxcfg_pkg_user}-${_wxcfg_pkg_name}-${_wxcfg_pkg_ident:0:7}"
_wxcfg_pkg_pkg_res="${_wxcfg_pkg_name_ident}.tar.gz::https://github.com/${_wxcfg_pkg_user}/${_wxcfg_pkg_name}/tarball/${_wxcfg_pkg_ident}"

# wxdap/wxdap submodule: https://github.com/eranif/wxdap
_wxdap_pkg_user="${_pkg_user}"
_wxdap_pkg_name="wxdap"
_wxdap_pkg_ident="c5ee34742728f97fa30d0877b925b260466057ba"
_wxdap_pkg_name_ident="${_wxdap_pkg_user}-${_wxdap_pkg_name}-${_wxdap_pkg_ident:0:7}"
_wxdap_pkg_src_res="${_wxdap_pkg_name_ident}.tar.gz::https://github.com/${_wxdap_pkg_user}/${_wxdap_pkg_name}/tarball/${_wxdap_pkg_ident}"

# wxshapeframework submodule: https://github.com/wxShaper/wxsf-code.git
_wxsf_pkg_user="wxShaper"
_wxsf_pkg_name="wxsf-code"
_wxsf_pkg_ident="b5dc09a9b94b9955ef98111d0f311cb43f32f649"
_wxsf_pkg_name_ident="${_wxsf_pkg_user}-${_wxsf_pkg_name}-${_wxsf_pkg_ident:0:7}"
_wxsf_pkg_src_res="${_wxsf_pkg_name_ident}.tar.gz::https://github.com/${_wxsf_pkg_user}/${_wxsf_pkg_name}/tarball/${_wxsf_pkg_ident}"

# yaml-cpp submodule: https://github.com/jbeder/yaml-cpp
_yaml_pkg_user="jbeder"
_yaml_pkg_name="yaml-cpp"
_yaml_pkg_ident="2f86d13775d119edbb69af52e5f566fd65c6953b"
_yaml_pkg_name_ident="${_yaml_pkg_user}-${_yaml_pkg_name}-${_yaml_pkg_ident:0:7}"
_yaml_pkg_src_res="${_yaml_pkg_name_ident}.tar.gz::https://github.com/${_yaml_pkg_user}/${_yaml_pkg_name}/tarball/${_yaml_pkg_ident}"

#
# sub-submodule
#

# tinyjson (cc-wrapper) sub-submodule: https://github.com/eranif/tinyjson
_ccwrap_tinyjson_pkg_user="${_pkg_user}"
_ccwrap_tinyjson_pkg_name="tinyjson"
_ccwrap_tinyjson_pkg_ident="a6b0d0d31a05a9f55b4944b3b20f769305eb583a"
_ccwrap_tinyjson_pkg_name_ident="${_ccwrap_tinyjson_pkg_user}-${_ccwrap_tinyjson_pkg_name}-${_ccwrap_tinyjson_pkg_ident:0:7}"
_ccwrap_tinyjson_pkg_src_res="${_ccwrap_tinyjson_pkg_name_ident}.tar.gz::https://github.com/${_ccwrap_tinyjson_pkg_user}/${_ccwrap_tinyjson_pkg_name}/tarball/${_ccwrap_tinyjson_pkg_ident}"


#
pkgdesc="Cross platform IDE for C, C++, Rust, Python, PHP and Node.js written in C++"
arch=('i686' 'x86_64' 'aarch64')
url="https://codelite.org/"
license=("GPL-2.0-or-later")

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

conflicts=('codelite-unstable')

source=(
    "${_pkg_src_res}"
    "${_asio_pkg_src_res}"
    "${_assistant_pkg_src_res}"
    "${_ccwrap_pkg_src_res}"
    "${_cjson_pkg_src_res}"
    "${_ctags_pkg_src_res}"
    "${_dtl_pkg_src_res}"
    "${_lexilla_pkg_src_res}"
    #"${_llama_pkg_src_res}"
    "${_wspp_pkg_src_res}"
    "${_wxcfg_pkg_pkg_res}"
    "${_wxdap_pkg_src_res}"
    "${_wxsf_pkg_src_res}"
    "${_yaml_pkg_src_res}"
    "${_ccwrap_tinyjson_pkg_src_res}"
    "http://repos.codelite.org/wxCrafterLibs/wxgui.zip"
  )

sha256sums=('6fe350112a395a9b9d2338880c22e014a6203d94205d48c1d17da40bb9d20a76'
            '31103eceeeee2a8119b0a4c9a5e5752ea94329941b9e9beaf67595c985aa3794'
            'ab03140cbc25b2aa11472324071ea73fbb140d221e09e00f17cc09b7b9854923'
            '9343c1f05956308c7f3c4b6ad33d68c08d95ef0ffcdce0ec6c883ccd21bd5f71'
            '70518c1b8203359c19b0313e05639568d8089cf9ffa9c9784970fdd69ab6eaad'
            'b9277072988a8318e7b2fec411c915eee0838dd05564d10e9e9381617458dd30'
            'baea37f9af8663240b56b634fd6e3ebd464f6b31f8ff520fc46b2ec8a8f4b3f5'
            '34b9a38f2b5e789a0d0aefa91df0fc4f18b1876589a78004e31b834e32821d98'
            'd5e2d3c9091dc3db660aaa1fb0c0c10dec95dabbeb42066d9bddc78491606e10'
            '0c13192f989832a2f72bcecd5e4a81b5ae744516a6e27d5f691dbd5f00167cb2'
            'f73110098732aecbfa160994261203be9bdacf16651df7a988911a9ef8199449'
            'bbc2c89cef2daba4aa15340ae73189c16dac5d20b8e2f98e9b120d4b6507d2a7'
            '1603dfef3d3457d2414eab1fb29bbdba8bf350b59745fff2f4f6c2a34d81b5af'
            'ff539f3e2ee4c52073e8b73fd8046163d68b0db567ce7ea5b9438424dc3a2253'
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
  # submodules
  cd "${srcdir}/${_pkg_name_ident}/submodules"

  # submodule asio
  test -d asio && rmdir asio
  ln -s -fn ../../${_asio_pkg_name_ident} asio

  # submodule assistant
  test -d assistant && rmdir assistant
  ln -s -fn ../../${_assistant_pkg_name_ident} assistant

  # submodule cc-wrapper
  test -d cc-wrapper && rmdir cc-wrapper
  ln -s -fn ../../${_ccwrap_pkg_name_ident} cc-wrapper

  # submodule cjson
  test -d cJSON && rmdir cJSON
  ln -s -fn ../../${_cjson_pkg_name_ident} cJSON

  # submodule ctags
  test -d ctags && rmdir ctags
  ln -s -fn ../../${_ctags_pkg_name_ident} ctags

  # submodule dtl
  test -d dtl && rmdir dtl
  ln -s -fn ../../${_dtl_pkg_name_ident} dtl

  # submodule lexilla
  test -d lexilla && rmdir lexilla
  ln -s -fn ../../${_lexilla_pkg_name_ident} lexilla

  ## submodule llama.cpp
  #test -d llama.cpp && rmdir llama.cpp
  #ln -s -fn ../../${_llama_pkg_name_ident} llama.cpp

  # submodule websocketpp
  test -d websocketpp && rmdir websocketpp
  ln -s -fn ../../${_wspp_pkg_name_ident} websocketpp

  # submodule wxdap
  test -d wxdap && rmdir wxdap
  ln -s -fn ../../${_wxdap_pkg_name_ident} wxdap

  # submodule wx-config-msys2
  test -d wx-config-msys2 && rmdir wx-config-msys2
  ln -s -fn ../../${_wxcfg_pkg_name_ident} wx-config-msys2

  # submodule wxsf
  test -d wxsf-code && rmdir wxsf-code
  ln -s -fn ../../${_wxsf_pkg_name_ident} wxsf-code

  # submodule yaml-cpp
  test -d yaml-cpp && rmdir yaml-cpp
  ln -s -fn ../../${_yaml_pkg_name_ident} yaml-cpp

  #
  # sub-submodules
  #

  # submodule tinyjson
  test -h tinyjson && rm -f tinyjson
  test -d tinyjson && rmdir tinyjson
  ln -s -fn ../../${_json_pkg_name_ident} tinyjson
  # sub-submodule tinyjson (below cc-wrapper)
  test -d cc-wrapper/tinyjson && rmdir cc-wrapper/tinyjson
  #ln -s ../tinyjson cc-wrapper/tinyjson
  ln -s -fn ../${_ccwrap_tinyjson_pkg_name_ident} cc-wrapper/tinyjson


  #
  # apply patches
  #
  cd "${srcdir}/${_pkg_name_ident}/"

  #patch -p0 < "${startdir}/codelite-fsw-symlink.patch"

  # dtl-v1.20 cannot compile on gcc >= 14.1.1 and clang >= 17.0.6
  #( cd submodules/dtl && patch -p0 < "${startdir}/dtl-dtl_Diff_hpp.patch" )

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

# -DWITH_NATIVEBOOK=1
cmake -S . -B "${BUILD_DIR}" \
    -G "Ninja" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCL_PREFIX=/usr \
    -DWITH_PCH=0  \
    -DWITH_WX_CONFIG="${WX_CONFIG}" \
    -DENABLE_LLDB=1 \
    -DENABLE_SFTP=1 \
    -DWITH_MYSQL=0 \
    -DCOPY_WX_LIBS=0 \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \


#-DCMAKE_INSTALL_RPATH=/opt/wxgtk-dev/lib

cmake --build "${BUILD_DIR}"

}

#
#
#
package()
{
cd "${srcdir}/${_pkg_name_ident}"

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
