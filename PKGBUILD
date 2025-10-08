# Maintainer: Martchus <martchus@gmx.net>
# Based on: AUR packages qt6-base-git and mingw-w64-qt6-base-git, official qt5-base package

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# This file is created from PKGBUILD.sh.ep contained by the mentioned repository.
# Do not edit it manually! See README.md in the repository's root directory
# for more information.

# All patches are managed at https://github.com/Martchus/qtbase

pkgname=mingw-w64-qt6-base
_qtver=6.10.0
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
        '0013-Workaround-Unknown-CMake-command-_qt_test_emscripten.patch'
        '0014-Fix-configuration-when-EMSCRIPTEN_ROOT-is-an-absolut.patch'
        '0015-Allow-keeping-Android-app-in-background-with-QtQuick.patch'
        '0016-Enable-minimal-and-offscreen-plugins-when-compiling-.patch'
        '0017-Allow-configuring-use-of-OpenSSL-in-QPasswordDigesto.patch'
        '0018-Drop-CMAKE_SYSTEM_VERSION-from-modules-json-if-Linux.patch'
        '0019-Workaround-linker-error-about-missing-symbol-__sync_.patch'
        '0020-Fix-Android-build-after-ec2e3e7ac92d000e0df0c693b9a6.patch')
sha256sums=('ead4623bcb54a32257c5b3e3a5aec6d16ec96f4cda58d2e003f5a0c16f72046d'
            '87ef32a9e2a122aa831ddb675ff072181c92152836544a3602e8fddbb4bd9788'
            'e806a7e9c2964dbf41a8fb2490b3d2302743c02279965702ac7ae880a3755816'
            '337fbbe749e4db3f1736c2f01bd47c8ac0e59218ac357d3c635d87ac4643cff7'
            '90834244a76b8f65b49cc5e0e167c937564da219fe3384e2db6c04ba933db266'
            'ca3eeb1808f16d6a309f9f4e2ebb5b07431e0abf389ba502eb0dd09de7adffa8'
            'bc1c71b3ae3f29f150ae590028f3decee2811cd90a707a78f94c8649c3af5c96'
            '98d9b3848a33536426a9c586f4e629895c528bb059997d9dd45f444a18fb8c4e'
            'e4eb19c0bb9027937d7271c416038821bebee8e30be72f4d058d050e256b1a21'
            '5a03020f5772cf10ce622d82162a86210332b3f9c64be70fcb42d2fafbaf8349'
            'cab1f4d5e4928987659f06dbffb1e721487b62c5ea8e42ba130e140ff09767b9'
            '7d39a7f582795fff773a361fff8f65f0d1bc0517736dd63c0371961c6662d0f8'
            'a07e36448cfe25ba0c8f9c37fa311fc43ac150aa147757db3d3a3c9624cef6e7'
            'e4134eb37252de9096caafc893e9cc105653a475a0cf7ef18e0835879a5ce23a'
            'b9f9927b994dae4cc4b70ea732e4b7af8e22dc7009393ded8cd36f02cf688fa2'
            'a7bb191656a3a83a35d14ecf097771a98c2b77697b16922cc805528fbf41ef81'
            'b938edd4ef7d1385093b6796f7ad561f42502a306b0c5e1496625eef836d7e62'
            '36c7502e672546433c98ddf06716411ce2c9c34a0091bb3d1c03827fbe5f09b5'
            'ff9d23b08375bfb20ffabf5d14953dda2593c95dd4f73a8027f8dbdd8e5d8fca'
            'f747bb4883ce88d615166c4268e9d12b9bc6fd5254d987bc098962cde27af5db'
            'caba7450bd4f28ed3e1ac85fa3180ed5207b791dfd7858430973f1ce561be437')

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

    # workaround hangs on startup when compiling with LLVM/Clang/libc++
    local additional_flags=()
    if [[ $pkgname =~ .*-clang-.* ]]; then
      # the culprit seems to be fortifying sources which has to be disabled completely (setting to 1 or 2 does
      # not help)
      additional_flags+=(
        -DCMAKE_C_FLAGS="${CFLAGS//-D_FORTIFY_SOURCE=3/}"
        -DCMAKE_CXX_FLAGS="${CXXFLAGS//-D_FORTIFY_SOURCE=3/}"
      )
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
      -DINPUT_openssl=runtime \
      "${additional_flags[@]}"
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
