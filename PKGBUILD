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
_pkg_ver="18.4.0"
#_commit="bf6820c7c8bece16c857f5a992aff23ac4ddc1ee"

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

# git submodule | sed -E 's/^ (.*) (.*) /\2  \t \1/g'

#  a78d4f1469890eb4e795709848ebf57b002ad369 submodules/LuaBridge (heads/master)
#  666897b95da9756d906cbfff1be123fe527b64f8 submodules/agent-sop (v1.1.2)
#  89cea946f8404dbe0224ba10b9abb406aff0cc0a submodules/assistant (remotes/origin/HEAD)
#  53464674ff2c287dfd68f05030d1d79e02d4974c submodules/cc-wrapper (remotes/origin/HEAD)
#  1da23a3e8119ec5cce4f9388e91b065e20bf06f5 submodules/doctest (v2.4.12)
#  32567bb9ec704f09040fb1ed7431a3d967e3df03 submodules/dtl (v1.21)
# -1d9a9ca8841ac0cd591c95b162301d2502641901 submodules/hunspell
#  8502988a5eb83fcd281ee5a38533a9f170e6b2bf submodules/lexilla (remotes/origin/HEAD)
# -854795c654eda518ed6de6c1ebb4e2107fcb2e73 submodules/libssh
#  bb8dc5ff01cf725dff2a8dcfe08fb0b81a9a7729 submodules/lua (heads/master)
# -7042229f977ca801983116593b2bbd73ae7f2657 submodules/openssl-cmake
# -8bb3ad01d5cbdef8d8f749d85df9fcd24d90923c submodules/wx-config-msys2
#  eba78200448022ba5dcca72a8a1a27ccdf873462 submodules/wxTerminalEmulator (heads/main-140-geba7820)
#  2eee32020c5309136358d422230abe24411d657f submodules/wxdap (remotes/origin/HEAD)
#  2f86d13775d119edbb69af52e5f566fd65c6953b submodules/yaml-cpp (0.8.0-74-g2f86d13)
# -0f51fb4933fc9ce18199cb2554dacea8033e7fd3 submodules/zlib

# NOTE: these submodules are currenly only used by macos builds - ignore them for now:
#   submodules/hunspell
#   submodules/libssh
#   submodules/openssl-cmake
#   submodules/wx-config-msys2
#   submodules/zlib

# submodules/LuaBridge
_luabridge_pkg_user="${_pkg_user}"
_luabridge_pkg_name="LuaBridge"
_luabridge_pkg_ident="a78d4f1469890eb4e795709848ebf57b002ad369"
_luabridge_pkg_name_ident="${_luabridge_pkg_user}-${_luabridge_pkg_name}-${_luabridge_pkg_ident:0:7}"
_luabridge_pkg_src_res="${_luabridge_pkg_name_ident}.tar.gz::https://github.com/${_luabridge_pkg_user}/${_luabridge_pkg_name}/tarball/${_luabridge_pkg_ident}"

# submodules/agent-sop: https://github.com/strands-agents/agent-sop.git
_agent_sop_pkg_user="strands-agents"
_agent_sop_pkg_name="agent-sop"
_agent_sop_pkg_ident="666897b95da9756d906cbfff1be123fe527b64f8"
_agent_sop_pkg_name_ident="${_agent_sop_pkg_user}-${_agent_sop_pkg_name}-${_agent_sop_pkg_ident:0:7}"
_agent_sop_pkg_src_res="${_agent_sop_pkg_name_ident}.tar.gz::https://github.com/${_agent_sop_pkg_user}/${_agent_sop_pkg_name}/tarball/${_agent_sop_pkg_ident}"

# submodules/assistant: ssh://github.com/eraniff/codelite-assistant.git
_assistant_pkg_user="${_pkg_user}"
_assistant_pkg_name="assistant"
_assistant_pkg_ident="89cea946f8404dbe0224ba10b9abb406aff0cc0a"
_assistant_pkg_name_ident="${_assistant_pkg_user}-${_assistant_pkg_name}-${_assistant_pkg_ident:0:7}"
_assistant_pkg_src_res="${_assistant_pkg_name_ident}.tar.gz::https://github.com/${_assistant_pkg_user}/${_assistant_pkg_name}/tarball/${_assistant_pkg_ident}"

# cjson submodule: https://github.com/DaveGamble/cJSON
_cjson_pkg_user="DaveGamble"
_cjson_pkg_name="cJSON"
_cjson_pkg_ident="fd1ac4f1791b403af1f7350b1195ac114f9b792b"
_cjson_pkg_name_ident="${_cjson_pkg_user}-${_cjson_pkg_name}-${_cjson_pkg_ident:0:7}"
_cjson_pkg_src_res="${_cjson_pkg_name_ident}.tar.gz::https://github.com/${_cjson_pkg_user}/${_cjson_pkg_name}/tarball/${_cjson_pkg_ident}"

# submodules/cc-wrapper : https://github.com/eranif/cc-wrapper
_ccwrap_pkg_user="${_pkg_user}"
_ccwrap_pkg_name="cc-wrapper"
_ccwrap_pkg_ident="53464674ff2c287dfd68f05030d1d79e02d4974c"
_ccwrap_pkg_name_ident="${_ccwrap_pkg_user}-${_ccwrap_pkg_name}-${_ccwrap_pkg_ident:0:7}"
_ccwrap_pkg_src_res="${_ccwrap_pkg_name_ident}.tar.gz::https://github.com/${_ccwrap_pkg_user}/${_ccwrap_pkg_name}/tarball/${_ccwrap_pkg_ident}"

# submodules/ctags: https://github.com/eranif/ctags
_ctags_pkg_user="${_pkg_user}"
_ctags_pkg_name="ctags"
_ctags_pkg_ident="ac5c942b422ca6dc6cdbfd2a0c2d481af1f18f02"
_ctags_pkg_name_ident="${_ctags_pkg_user}-${_ctags_pkg_name}-${_ctags_pkg_ident:0:7}"
_ctags_pkg_src_res="${_ctags_pkg_name_ident}.tar.gz::https://github.com/${_ctags_pkg_user}/${_ctags_pkg_name}/tarball/${_ctags_pkg_ident}"

# submodules/doctest: https://github.com/doctest/doctest
_doctest_pkg_user="doctest"
_doctest_pkg_name="doctest"
_doctest_pkg_ident="1da23a3e8119ec5cce4f9388e91b065e20bf06f5"
_doctest_pkg_name_ident="${_doctest_pkg_user}-${_doctest_pkg_name}-${_doctest_pkg_ident:0:7}"
_doctest_pkg_src_res="${_doctest_pkg_name_ident}.tar.gz::https://github.com/${_doctest_pkg_user}/${_doctest_pkg_name}/tarball/${_doctest_pkg_ident}"

# submudules/dtl: https://github.com/cubicdaiya/dtl
_dtl_pkg_user="cubicdaiya"
_dtl_pkg_name="dtl"
_dtl_pkg_ident="32567bb9ec704f09040fb1ed7431a3d967e3df03"
_dtl_pkg_name_ident="${_dtl_pkg_user}-${_dtl_pkg_name}-${_dtl_pkg_ident:0:7}"
_dtl_pkg_src_res="${_dtl_pkg_name_ident}.tar.gz::https://github.com/${_dtl_pkg_user}/${_dtl_pkg_name}/tarball/${_dtl_pkg_ident}"

# submodules/hunspell - ignored

# submodules/lexilla: https://github.com/eranif/lexilla.git
_lexilla_pkg_user="eranif"
_lexilla_pkg_name="lexilla"
_lexilla_pkg_ident="8502988a5eb83fcd281ee5a38533a9f170e6b2bf"
_lexilla_pkg_name_ident="${_lexilla_pkg_user}-${_lexilla_pkg_name}-${_lexilla_pkg_ident:0:7}"
_lexilla_pkg_src_res="${_lexilla_pkg_name_ident}.tar.gz::https://github.com/${_lexilla_pkg_user}/${_lexilla_pkg_name}/tarball/${_lexilla_pkg_ident}"

# submodules/libssh - ignored

# submodules/lua: https://github.com/eranif/lua.git
_lua_pkg_user="${_pkg_user}"
_lua_pkg_name="lua"
_lua_pkg_ident="bb8dc5ff01cf725dff2a8dcfe08fb0b81a9a7729"
_lua_pkg_name_ident="${_lua_pkg_user}-${_lua_pkg_name}-${_lua_pkg_ident:0:7}"
_lua_pkg_src_res="${_lua_pkg_name_ident}.tar.gz::https://github.com/${_lua_pkg_user}/${_lua_pkg_name}/tarball/${_lua_pkg_ident}"

# submodules/openssl-cmake - ignored

# submodules/wx-config-msys2: wxcfg/wx-config-msys2s: https://github.com/eranif/wx-config-msys2.git
_wxcfg_pkg_user="${_pkg_user}"
_wxcfg_pkg_name="wx-config-msys2"
_wxcfg_pkg_ident="8bb3ad01d5cbdef8d8f749d85df9fcd24d90923c"
_wxcfg_pkg_name_ident="${_wxcfg_pkg_user}-${_wxcfg_pkg_name}-${_wxcfg_pkg_ident:0:7}"
_wxcfg_pkg_src_res="${_wxcfg_pkg_name_ident}.tar.gz::https://github.com/${_wxcfg_pkg_user}/${_wxcfg_pkg_name}/tarball/${_wxcfg_pkg_ident}"

# submodules/wxTerminalEmulator: https://github.com/eranif/wxTerminalEmulator.git
_wxterm_pkg_user="${_pkg_user}"
_wxterm_pkg_name="wxTerminalEmulator"
_wxterm_pkg_ident="eba78200448022ba5dcca72a8a1a27ccdf873462"
_wxterm_pkg_name_ident="${_wxterm_pkg_user}-${_wxterm_pkg_name}-${_wxterm_pkg_ident:0:7}"
_wxterm_pkg_src_res="${_wxterm_pkg_name_ident}.tar.gz::https://github.com/${_wxterm_pkg_user}/${_wxterm_pkg_name}/tarball/${_wxterm_pkg_ident}"

# submodules/wxdap: https://github.com/eranif/wxdap
_wxdap_pkg_user="${_pkg_user}"
_wxdap_pkg_name="wxdap"
_wxdap_pkg_ident="2eee32020c5309136358d422230abe24411d657f"
_wxdap_pkg_name_ident="${_wxdap_pkg_user}-${_wxdap_pkg_name}-${_wxdap_pkg_ident:0:7}"
_wxdap_pkg_src_res="${_wxdap_pkg_name_ident}.tar.gz::https://github.com/${_wxdap_pkg_user}/${_wxdap_pkg_name}/tarball/${_wxdap_pkg_ident}"

# submodules/yaml-cpp: https://github.com/jbeder/yaml-cpp
_yaml_pkg_user="jbeder"
_yaml_pkg_name="yaml-cpp"
_yaml_pkg_ident="2f86d13775d119edbb69af52e5f566fd65c6953b"
_yaml_pkg_name_ident="${_yaml_pkg_user}-${_yaml_pkg_name}-${_yaml_pkg_ident:0:7}"
_yaml_pkg_src_res="${_yaml_pkg_name_ident}.tar.gz::https://github.com/${_yaml_pkg_user}/${_yaml_pkg_name}/tarball/${_yaml_pkg_ident}"

# submodules/zlib - ignored

#
# sub-sub submodules
#

# tinyjson (cc-wrapper) sub-submodule: https://github.com/eranif/tinyjson
_ccwrap_tinyjson_pkg_user="${_pkg_user}"
_ccwrap_tinyjson_pkg_name="tinyjson"
_ccwrap_tinyjson_pkg_ident="d51ef6fc646d60c1400ebde767ebfdd2b7361482"
_ccwrap_tinyjson_pkg_name_ident="${_ccwrap_tinyjson_pkg_user}-${_ccwrap_tinyjson_pkg_name}-${_ccwrap_tinyjson_pkg_ident:0:7}"
_ccwrap_tinyjson_pkg_src_res="${_ccwrap_tinyjson_pkg_name_ident}.tar.gz::https://github.com/${_ccwrap_tinyjson_pkg_user}/${_ccwrap_tinyjson_pkg_name}/tarball/${_ccwrap_tinyjson_pkg_ident}"

#
#
#
pkgdesc="Cross platform IDE for C, C++, Rust, Python, PHP and Node.js written in C++"
arch=('i686' 'x86_64' 'aarch64')
url="https://codelite.org/"
license=("GPL-2.0-or-later")

makedepends=('pkgconfig' 'cmake' 'ninja' 'clang')

depends=(
    'wxwidgets-gtk3'
    'wxwidgets-common'
    'libedit'
    'libssh'
    'zlib'
    'mariadb-libs'
    'ncurses'
    'patch'
    'uchardet'
    'hunspell'
    'glibc'
    'libstdc++'
    'libgcc'
    'glib2'
    'python'
    'openssl'
    'sqlite'
    #'ctags'
    #'xterm'
    #'wget'
    #'curl'
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
    "${_luabridge_pkg_src_res}"
    "${_agent_sop_pkg_src_res}"
    "${_assistant_pkg_src_res}"
    "${_ccwrap_pkg_src_res}"
    "${_cjson_pkg_src_res}"
    "${_ctags_pkg_src_res}"
    #"${_doctest_pkg_src_res}"
    "${_dtl_pkg_src_res}"
    "${_lexilla_pkg_src_res}"
    "${_lua_pkg_src_res}"
    "${_wxcfg_pkg_src_res}"
    "${_wxterm_pkg_src_res}"
    "${_wxdap_pkg_src_res}"
    "${_yaml_pkg_src_res}"
    "${_ccwrap_tinyjson_pkg_src_res}"
    "http://repos.codelite.org/wxCrafterLibs/wxgui.zip"
  )

sha256sums=('bbb71f82926fcef0821776b404f7580fb42f1065f9f8153598d25cf3240c4d29'
            '1cb22a33ddacbafa9b3526e248b9abfed098d87bcbbd793774af2e816c6eb94e'
            '674519d58ab53166514b12446a83ac61a0641c8ce424b54ecf34653d12d636e3'
            'cef5805a14f95eee28b0e2ea6add6e91271c08c195c1f40675a30df620f1ca5e'
            'fa90de0cadd10d875af9fc08142a46079fc024ba5afebb23fa1a966807980dc8'
            '70518c1b8203359c19b0313e05639568d8089cf9ffa9c9784970fdd69ab6eaad'
            'b9277072988a8318e7b2fec411c915eee0838dd05564d10e9e9381617458dd30'
            'baea37f9af8663240b56b634fd6e3ebd464f6b31f8ff520fc46b2ec8a8f4b3f5'
            '34b9a38f2b5e789a0d0aefa91df0fc4f18b1876589a78004e31b834e32821d98'
            '1032a78573385a7ebdbebeb88441fd041b0b377c8c2456ddf9290f11aa7ea41a'
            '0c13192f989832a2f72bcecd5e4a81b5ae744516a6e27d5f691dbd5f00167cb2'
            'd8525774b076ea9f60853ab0220356e2f6c411b1bdc72b7c876fd5320108e2d3'
            'aa53f13b9b67bd3e86dfc441389fcf576ce13f1206082885f6088eea12814998'
            '1603dfef3d3457d2414eab1fb29bbdba8bf350b59745fff2f4f6c2a34d81b5af'
            'e9464a9c0a5e7bddf6759410602088d51c41faea2c39ec5759add8ddf1305687'
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

  # submodules/LuaBridge
  test -L LuaBridge && rm LuaBridge;
  test -d LuaBridge && rmdir LuaBridge;
  ln -s -fn ../../${_luabridge_pkg_name_ident} LuaBridge;

  # submodules/agent-sop
  test -L agent-sop && rm agent-sop;
  test -d agent-sop && rmdir agent-sop;
  ln -s -fn ../../${_agent_sop_pkg_name_ident} agent-sop;

  # submodules/assistant
  test -L assistant && rm assistant;
  test -d assistant && rmdir assistant;
  ln -s -fn ../../${_assistant_pkg_name_ident} assistant;

  # submodules/cjson
  test -L cJSON && rm cJSON;
  test -d cJSON && rmdir cJSON;
  ln -s -fn ../../${_cjson_pkg_name_ident} cJSON;

  # submodules/cc-wrapper
  test -L cc-wrapper && rm cc-wrapper;
  test -d cc-wrapper && rmdir cc-wrapper;
  ln -s -fn ../../${_ccwrap_pkg_name_ident} cc-wrapper;

  # submodules/ctags
  test -L ctags && rm ctags;
  test -d ctags && rmdir ctags;
  ln -s -fn ../../${_ctags_pkg_name_ident} ctags;

  # submodules/doctest
  test -L doctest && rm doctest;
  test -d doctest && rmdir doctest;
  ln -s -fn ../../${_doctest_pkg_name_ident} doctest;

  # submodules/dtl
  test -L dtl && rm dtl;
  test -d dtl && rmdir dtl;
  ln -s -fn ../../${_dtl_pkg_name_ident} dtl;

  # submodules/hunspell - ignore

  # submodules/lexilla
  test -L lexilla && rm lexilla;
  test -d lexilla && rmdir lexilla;
  ln -s -fn ../../${_lexilla_pkg_name_ident} lexilla;

  # submodules/libssh - ignore

  # submodules/lua
  test -L lua && rm lua;
  test -d lua && rmdir lua;
  ln -s -fn ../../${_lua_pkg_name_ident} lua;

  # submodules/openssl - ignore

  # submodules/wx-config-msys2
  test -L wx-config-msys2 && rm wx-config-msys2;
  test -d wx-config-msys2 && rmdir wx-config-msys2;
  ln -s -fn ../../${_wxcfg_pkg_name_ident} wx-config-msys2;

  # submodules/wxTerminalEmulator
  test -L wxTerminalEmulator && rm wxTerminalEmulator
  test -d wxTerminalEmulator && rmdir wxTerminalEmulator
  ln -s -fn ../../${_wxterm_pkg_name_ident} wxTerminalEmulator;

  # submodules/wxdap
  test -d wxdap && rmdir wxdap;
  ln -s -fn ../../${_wxdap_pkg_name_ident} wxdap;

  # submodules/yaml-cpp
  test -L yaml-cpp && rm yaml-cpp;
  test -d yaml-cpp && rmdir yaml-cpp;
  ln -s -fn ../../${_yaml_pkg_name_ident} yaml-cpp;

  # submodules/zlib - ignore

  #
  # sub-submodules
  #

  # submodules/tinyjson
  test -L tinyjson && rm -f tinyjson;
  test -d tinyjson && rmdir tinyjson;
  ln -s -fn ../../${_json_pkg_name_ident} tinyjson;
  # sub-submodule tinyjson (below cc-wrapper)
  test -L cc-wrapper/tinyjson && rm cc-wrapper/tinyjson;
  test -d cc-wrapper/tinyjson && rmdir cc-wrapper/tinyjson;
  #ln -s ../tinyjson cc-wrapper/tinyjson;
  ln -s -fn ../${_ccwrap_tinyjson_pkg_name_ident} cc-wrapper/tinyjson;


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
#WX_CONFIG="/usr/bin/wx-config-gtk3"
#WX_CONFIG="wx-config-gtk3"
#WX_CONFIG="wx-config-gtk2"
#WX_CONFIG="wx-config-3.3.2"
#WX_CONFIG="wx-config"
WX_CONFIG=$(command -v wx-config-3.3.2 wx-config-3.3.1 wx-config-3.3.0 wx-config-3.3 wx-config-3.2 wx-config | head -1);

echo;
echo "WX_CONFIG: ${WX_CONFIG}";
echo;
${WX_CONFIG} --version;
echo;
${WX_CONFIG} --version-full;
echo;


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
