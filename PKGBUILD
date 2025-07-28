# Maintainer: Martchus <martchus@gmx.net>
# Based on: AUR packages qt6-base-git and mingw-w64-qt6-base-git, official qt5-base package

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# This file is created from PKGBUILD.sh.ep contained by the mentioned repository.
# Do not edit it manually! See README.md in the repository's root directory
# for more information.

# All patches are managed at https://github.com/Martchus/qtbase

pkgname=mingw-w64-qt6-base-static
_qtver=6.9.1
pkgver=${_qtver/-/}
pkgrel=2
arch=(any)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='A cross-platform application and UI framework (mingw-w64)'
depends=('mingw-w64-crt' 'mingw-w64-cppwinrt' 'mingw-w64-zlib' 'mingw-w64-libjpeg-turbo' 'mingw-w64-sqlite'
         'mingw-w64-libpng' 'mingw-w64-openssl' 'mingw-w64-dbus' 'mingw-w64-harfbuzz'
         'mingw-w64-brotli' 'mingw-w64-pcre2' 'mingw-w64-zstd')
makedepends=('qt6-base' 'ninja' 'mingw-w64-cmake-static'
             'mingw-w64-vulkan-headers' 'mingw-w64-vulkan-icd-loader' 'mingw-w64-pkg-config')
optdepends=('qt6-base: development tools')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
if ! [[ $pkgname =~ .*-clang-.* ]]; then
  makedepends+=('mingw-w64-postgresql' 'mingw-w64-mariadb-connector-c')
  optdepends+=('mingw-w64-postgresql: PostgreSQL driver'
               'mingw-w64-mariadb-connector-c: MariaDB driver')
fi
groups=(mingw-w64-qt6)
_pkgfqn="qtbase-everywhere-src-${_qtver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz"
        '0001-Use-CMake-s-default-import-library-suffix.patch'
        '0002-Fix-finding-D-Bus.patch'
        '0003-Fix-using-static-PCRE2-and-DBus-1.patch'
        '0004-Fix-transitive-dependencies-of-static-libraries.patch'
        '0005-Fix-libjpeg-workaround-for-conflict-with-rpcndr.h.patch'
        '0006-Support-finding-static-MariaDB-client-library.patch'
        '0007-Allow-overriding-CMAKE_FIND_LIBRARY_SUFFIXES-to-pref.patch'
        '0008-Find-fontconfig-via-pkg-config-for-correct-handling-.patch'
        '0009-Fix-dependency-of-xcb-image-on-xcb-util.patch'
        '0010-Allow-using-properties-of-PkgConfig-targets-for-glib.patch'
        '0011-Allow-using-properties-of-PkgConfig-targets-for-Wayl.patch'
        '0012-Allow-overriding-preference-for-shared-libzstd-libra.patch'
        '0013-Fix-errors-due-to-disabled-exceptions-with-cpp_winrt.patch'
        '0014-Link-corelib-correctly-against-runtimeobject-when-co.patch'
        '0015-Workaround-linker-error-about-missing-symbol-__sync_.patch'
        '0016-Workaround-Unknown-CMake-command-_qt_test_emscripten.patch'
        '0017-Fix-configuration-when-EMSCRIPTEN_ROOT-is-an-absolut.patch'
        '0018-Allow-handling-Android-activity-lifecycle-by-user-pr.patch'
        '0019-Avoid-compile-error-due-to-inconsistent-use-of-noexc.patch'
        '0020-Allow-keeping-Android-app-in-background-with-QtQuick.patch'
        '0021-Allow-resuming-native-app-when-Android-activity-is-r.patch'
        '0022-Enable-minimal-and-offscreen-plugins-when-compiling-.patch'
        '0023-Allow-configuring-use-of-OpenSSL-in-QPasswordDigesto.patch'
        '0024-Http2-fix-handling-incoming-frames-on-locally-reset-.patch'
        '0025-Http2-Explicitly-send-RST_STREAM-on-cancelled-reques.patch'
        '0026-Http2ProtocolHandler-fix-logic-error-with-potential-.patch'
        '0027-QMainWindowTabBar-Use-QPointer-for-mainWindow-member.patch'
        '0028-QMainWindowTabBar-dockAt-avoid-nullptr-access.patch'
        '0029-Centralise-usage-of-unused-tab-bars-in-QMainWindowLa.patch'
        '0030-Remove-handling-of-unused-tab-bars-in-QMainWindowLay.patch'
        '0031-Drop-CMAKE_SYSTEM_VERSION-from-modules-json-if-Linux.patch')
sha256sums=('40caedbf83cc9a1959610830563565889878bc95f115868bbf545d1914acf28e'
            'e46f347a1c963a2210fc2fdc578b721077e5477c0c13518392e3deb2467810bd'
            '29ce2fb8f840c855ee4879fc64cc06ebfbb7f59d13ebddc189ed4ac8f02db58e'
            'e3225d0a12c8653a6b8bd263497364cffb4df997b7dceb04ee9adc5487177efb'
            'c8ba162438fe83d33dedbcb81b5340982986fc47d2739e6e5f516936c80725ab'
            'afd633ee64ceff42bdfcec110fc7e98ae159b32882d5582c4008b2940ee9c0aa'
            '28e5c7b53c39405ed99895ffd24339365a9ccd049d11631bb40638e4faeaaa86'
            '7051fb181af18f2ea3a424b7b43d989914332fe7f1ec5d9685ca9343679ecec8'
            '6d8eb3582f440623f7ee7c677fddb62e10c402b17d990a18d8d9a30065485af3'
            'a2cc47aa484d31c51ab866deed79027d8977b0af9d3dc7ece33e236e2692c5cb'
            '53c9dab824074d1708aa35e9cb65d4f9daf0f3b571b5145925245210abca9c53'
            '9930bab3041d7cf0df7f781f3535733882af1ff8968479452d091c26c491add9'
            '35e91c03bf2ce3980d9aedcb46b510c4aa4bc2bfedbbdd8e822447b34473b194'
            '9c21ba02c6aa78bfef6e0626f72706d532f1d7fcb70d86b9b4a0eb3836590570'
            'b1e66ed8551624bb53b76db632c51b9be2f9e9656d3b272cc5c3611121c15517'
            '1ada35a687288c774c3110b56f2237a919ab0c3db18dff2f8cd06f1d51a706de'
            'a1e661b9afcfd40b9ecf513a2402dfad1937185d42744fca00b459b8918e9384'
            'cf8e74c294a6557e0d0bd530bd47c6b929d1ff0c036569546793e7ea3866858d'
            'ad7556f3b086f8d9c932c42cccf4758a4ab9ebfd2810667886208331b7812a56'
            '3d28eb6163cbeeaff1547b3f2942f32267f34fddcdbf0c909f51337cb609164a'
            'e3a84e7580c3258105d2f9491ddf48a40dd180af111d5cea26eaf8428daf5897'
            '9111714e550c26a5b6dac2111a337b283365e4d5fd4152318d2008729911df36'
            'c3bf9af44b28c4647c53ee52edb54731978ecf9feb898ab1c748dab9458f7948'
            '85620d00fed3c66ddc01a3940966fdb36a74545d893591110e8f2e8f4fa39aef'
            '568dc067e534fc7e2b981bef3657b57205cdcefee2a4d9081ba1d72dfa945b46'
            '8891c163bf98cb3ef4a15bd643a7c53878c8e8b755fc90a42bc6104b9cdc638b'
            '8f6ad2a373a6c20287f93584f7261537eddf0296643f76cd51ad0a8473440ec8'
            'b98db26c341941031ed3169b8aed6326154a572abc0487c91980ef1739d6ad0d'
            'ae6a8dd9d329b7d715babf734ef71bd0ccb257c80ad17d4b269407481590d8ed'
            '8a9700e7c99351108ca6b6e1f4c9d72bd42e555b0f6c76a796f8ef8a0fc8dee6'
            '6d2a0aa75000ba3b7ae4a08d99120d53055abb49c69ade2438e5b314e21326a0'
            '5e29465d3cc67b23d9b8c7ca9e0d3807b393745795df4bd719481fb43bd89db1')

# disable i686 build because 32-bit Windows is generally not supported by upstream and
# it does not build anymore as of GCC 14 (probably due to commit 9a19fa8b616f83474c35cc5b34a3865073ced829)
# remarks:
# - This is in-line with MSYS2's packaging of mingw-w64 Qt 6 packages.
# - You may override MINGW_W64_QT6_ARCHS by adding the variable to `/etc/makepkg.conf` in case you
#   nevertheless want to attempt the i686 build.
_architectures=${MINGW_W64_QT6_ARCHS:-x86_64-w64-mingw32}

prepare () {
  cd $_pkgfqn

  # apply patches; further descriptions can be found in patch files itself
  for patch in "$srcdir/"*.patch; do
    msg2 "Applying patch $patch"
    patch -p1 -i "$patch"
  done
}

build() {
  for _arch in ${_architectures}; do
    export PKG_CONFIG=/usr/bin/$_arch-pkg-config

    # workaround https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120495
    [[ $pkgname =~ .*-clang-.* ]] || export CXXFLAGS+=' -Wno-template-body -fcoroutines'

    local _enable_winrt_support=ON
    if [[ ! -e /usr/${_arch}/include/winrt/Windows.Foundation.h ]]; then
      echo "cppwinrt headers seem incomplete, disabling FEATURE_cpp_winrt"
      _enable_winrt_support=OFF
    fi

    $_arch-cmake-static -G Ninja -B build-$_arch -S $_pkgfqn \
      -DCMAKE_INSTALL_PREFIX:PATH="/usr/$_arch/static" \
      -DUSE_LINK_GROUP=OFF \
      -DFEATURE_static_runtime=ON \
      -DFEATURE_openssl_linked=ON \
      -DFEATURE_openssl_hash=OFF \
      -DFEATURE_openssl_password_digestor=OFF \
      -DFEATURE_cxx20=ON \
      -DFEATURE_cpp_winrt=$_enable_winrt_support \
      -DFEATURE_pkg_config=ON \
      -DFEATURE_system_pcre2=ON \
      -DFEATURE_system_freetype=ON \
      -DFEATURE_system_harfbuzz=ON \
      -DFEATURE_system_sqlite=ON \
      -DINSTALL_BINDIR=lib/qt6/bin \
      -DINSTALL_DOCDIR=share/doc/qt6 \
      -DINSTALL_ARCHDATADIR=lib/qt6 \
      -DINSTALL_DATADIR=share/qt6 \
      -DINSTALL_INCLUDEDIR=include/qt6 \
      -DINSTALL_MKSPECSDIR=lib/qt6/mkspecs \
      -DINSTALL_EXAMPLESDIR=share/doc/qt6/examples \
      -DINPUT_openssl=linked
    VERBOSE=1 cmake --build build-$_arch
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --install build-$_arch

    install -Dm644 $_pkgfqn/LICENSES/* -t "$pkgdir"/usr/share/licenses/$pkgname

    # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
    find "$pkgdir/usr/$_arch/static/lib" -type f -name '*.prl' \
      -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

    find "$pkgdir/usr/$_arch" -iname '*.exe' -exec $_arch-strip --strip-all {} \;
    find "$pkgdir/usr/$_arch" -iname '*.dll' -exec $_arch-strip --strip-unneeded {} \;
    find "$pkgdir/usr/$_arch" -iname '*.a'   -exec $_arch-strip -g {} \;
    [[ -d "$pkgdir/usr/$_arch/static/share/doc" ]] && rm -r "$pkgdir/usr/$_arch/static/share/doc"
  done
}
