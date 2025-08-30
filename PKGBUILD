# Maintainer: Martchus <martchus@gmx.net>
# Based on: AUR packages qt6-base-git and mingw-w64-qt6-base-git, official qt5-base package

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# This file is created from PKGBUILD.sh.ep contained by the mentioned repository.
# Do not edit it manually! See README.md in the repository's root directory
# for more information.

# All patches are managed at https://github.com/Martchus/qtbase

pkgname=mingw-w64-qt6-base
_qtver=6.9.2
pkgver=${_qtver/-/}
pkgrel=1
arch=(any)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='A cross-platform application and UI framework (mingw-w64)'
depends=('mingw-w64-crt' 'mingw-w64-cppwinrt' 'mingw-w64-zlib' 'mingw-w64-libjpeg-turbo' 'mingw-w64-sqlite'
         'mingw-w64-libpng' 'mingw-w64-openssl' 'mingw-w64-dbus' 'mingw-w64-harfbuzz'
         'mingw-w64-brotli' 'mingw-w64-pcre2' 'mingw-w64-zstd')
makedepends=('qt6-base' 'ninja' 'mingw-w64-cmake'
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
        '0024-Drop-CMAKE_SYSTEM_VERSION-from-modules-json-if-Linux.patch'
        '0025-Revert-Re-land-Android-destroy-the-window-surface-on.patch')
sha256sums=('44be9c9ecfe04129c4dea0a7e1b36ad476c9cc07c292016ac98e7b41514f2440'
            '281d00a4a7d3e771be4ead82bf8b996f47f724fae861b0057a7ae7c495528aef'
            'e7155b4fa342141cd8423f3412dad6d6232503ac4137bb5371e47ad6ce0b4066'
            '800932929502bad92208b63934d2cf8b565111bdbde3e36fcb0e231423422ecf'
            '614f6efd1c11f6fcad9594264ff54abf8a817d83c435246bf2cc2c13b03cd38d'
            '578563b8203a49478bd00637d29caa580e4710f343ff3835dd022736adf10119'
            '522fa789e2d866303602c917dbf9572e2a52b27b3bd5a6a2b99f58a16f0013f3'
            '7bbdfd8b9ccf92b3a388725b3113a613c87da6907402796a9b9b57c525c3f4b0'
            '17f796d8cdfa3fe2c84eaf2f213384d020c15fa2d06cfceb89495eb772db7dec'
            '862a69d9c30a94c156189aecd6f689e07fb609b7af5ccf84f9412ccc227d9729'
            'efb2647445553958e74a7954f41d38212dc1db3f071022887741aab87eca0b10'
            '294077128425b51f6f5e01c444b51b1c0121ee8eb4ca2bcca295dc3c334e0eb2'
            '5249b64232e74fd96d1171a7e7083f8af2e4cb8dd37b79d3ca273dbcb9c48159'
            '16c36ae4aa2e5078eba55c9b510a88e89f50b514ad6b48fa866943246509d811'
            '3a04d24b89195c55de3f7e7b566c050f60daa8942d0916a1772e9b1b570be40c'
            '1711f706050799186e7d59d44e901a2f67669155d608dc8ca7f945a39af24844'
            'd12d30bd680dc30b5cdc8844c2c1caeaccdaa8124433020118f9b3c0c8fd9061'
            '8857aa6a48210f0c00ee7a066eb04340fc8fce97af58f1fb6f5c1a1a4652558c'
            '117b802dfeecf64c54de83a1a8b40e1c7f70a55466870e684486d569c20ff2f0'
            '2ab1cfe83d30da2f2b33fb8ad9bb7c252567c7fd9e9c569a4f8be41b385912fd'
            '7a444d84daebdbce128441a331d275f26e95101e69e4bfc866edb419802b6f87'
            '46e96e1b943e826de90c4d0fb0db6b4828e45bd622647b6977752aa65e22160a'
            '7905bffa0c6f4d99eade26671012a1b55722a84ee747550ddf79e30440f18add'
            '14911b44553e79510d394fc0a750a5b095df6825343b0ab40f024c873d7c0a89'
            'aae9bd027404bf83dbda49edca08fa763f8f147f2c8ae0c627773542e7bc10a6'
            '89a9ba6842ad518f05f08ab57542a63c1412c0f07a9a0289f2de8a42553797ae')

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

    $_arch-cmake -G Ninja -B build-$_arch -S $_pkgfqn \
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
      -DINPUT_openssl=runtime
    VERBOSE=1 cmake --build build-$_arch
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --install build-$_arch

    install -Dm644 $_pkgfqn/LICENSES/* -t "$pkgdir"/usr/share/licenses/$pkgname

    # Add symlinks of DLLs in usual bin directory
    mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/$_arch/bin"
    for dll in "$pkgdir"/usr/$_arch/lib/qt6/bin/*.dll; do
        ln -rs "$dll" "$pkgdir/usr/$_arch/bin/${dll##*/}"
    done

    # Symlinks for backwards compatibility
    for qmake; do
        ln -rs "$pkgdir"/usr/$_arch/lib/qt6/bin/$_b "$pkgdir"/usr/bin/$_arch-$_b-qt6
    done

    # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
    find "$pkgdir/usr/$_arch/lib" -type f -name '*.prl' \
      -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

    find "$pkgdir/usr/$_arch" -iname '*.exe' -exec $_arch-strip --strip-all {} \;
    find "$pkgdir/usr/$_arch" -iname '*.dll' -exec $_arch-strip --strip-unneeded {} \;
    find "$pkgdir/usr/$_arch" -iname '*.a'   -exec $_arch-strip -g {} \;
    [[ -d "$pkgdir/usr/$_arch/share/doc" ]] && rm -r "$pkgdir/usr/$_arch/share/doc"
  done
}
