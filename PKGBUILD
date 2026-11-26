# Maintainer: Martchus <martchus@gmx.net>
# Based on: AUR packages qt6-base-git and mingw-w64-qt6-base-git, official qt5-base package

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# This file is created from PKGBUILD.sh.ep contained by the mentioned repository.
# Do not edit it manually! See README.md in the repository's root directory
# for more information.

# All patches are managed at https://github.com/Martchus/qtbase

pkgname=mingw-w64-qt6-base-static
_qtver=6.12.1
pkgver=${_qtver/-/}
pkgrel=1
arch=(any)
url='https://www.qt.io'
license=(GPL-3.0-only
         LGPL-3.0-only
         LicenseRef-Qt-Commercial
         Qt-GPL-exception-1.0)
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
        '0013-Workaround-Unknown-CMake-command-_qt_test_emscripten.patch'
        '0014-Fix-configuration-when-EMSCRIPTEN_ROOT-is-an-absolut.patch'
        '0015-Allow-keeping-Android-app-in-background-with-QtQuick.patch'
        '0016-Allow-configuring-use-of-OpenSSL-in-QPasswordDigesto.patch'
        '0017-Workaround-linker-error-about-missing-symbol-__sync_.patch'
        '0018-Fix-Android-build-after-ec2e3e7ac92d000e0df0c693b9a6.patch'
        '0019-Fix-inclusion-of-OpenGL-header-after-Qt-6-header.patch'
        '0020-Use-a-more-reasonable-fallback-directory-for-fonts-o.patch'
        '0021-Undefine-mingw-stat.patch'
        '0022-Export-some-constexpr-variables.patch')
sha256sums=('cd837bb9fd631e20439a04eaa0c2f252f19ad92fdf5adf10229d0fbc2fab2d53'
            'a33c4cadb318ab69e81641f89f1bba88fa39ec2492db7a9dab40fc1e94193971'
            'd2411660326218630f5db0dc9e0f443a1eb15bfba1d177e4f6e9d00e39f00885'
            '1fcd13a2f75ea734ca6d317e387aff5d9361e896df82ad4ed52648a31a69b4d9'
            '0d7728dd6be439d9da79e0ba8938bcbcf9c587ced0148b8d2fa1a2bf8fce1139'
            'c4b5669d3c904dbb19265a44c82f8b89280998b284a7ddb8b4fd1867cef5fdb2'
            'aca0ca6ab3381a9ae06910d9f044cac24be5832b3a847dbcb542917705ced8b4'
            '80a8f9c92c2ec5e251c7f6051242f7168eac4edf82903555f37feee5e9f4cf85'
            '71ccd43cfaef0281d9f144ef30b334040571bdc819195a0cb622a89d949d5e96'
            '5976472120ef3340a46236b2a1f131ba25b83b93ca6aa82be5364d4cddbaded2'
            '092bf86a766fb20b72184d379b391fd7a5a04d807e369138c6f35a3c77831566'
            '2911755342dda6a0198b4dfed8b3aac5c3c159c03ecec8c03e3a9dc0ede54f79'
            '29cf8768901dd3945554e2580bd970b78409fd5e824f568d0c7222b9f259691e'
            'd52d0a98a72b1548a869d2323f5667974d93056c4a4da7040df51e5275d459a8'
            'ed467b086a3ab289a1b88b07c603e669b69a221a08833411312f7213b4f92573'
            'b9e88a01f51506056d1ed29ae3c8f623e9155a10cde0146d2f135f9a4c87ab1d'
            'f46a255cba36193348ce8ce9bbc645ae383430be94616ad4af099b0b7d156f57'
            '3db0a41977d6343887809f116d8663d62eedc418f68681a6fe85c5c3ba17cde4'
            '4d4e4b0f0fa0bfec9e73275bf0ca685f8babc72fe738a8c997322790e312232b'
            'e13277caf7216dc88d7d33dfcf6339d422b567c9b086233d73f3232a7f9b9fa8'
            'fb67889147a9499c2a61af3e36299c920744b89acca393329b03f30b2918437c'
            '8bc62009c436f812e4aca3ff009dcddc32045c1f313d2bc7d729d2f1f9993c95'
            '2e8b098c8560d697ed5793a8e481d8e8e030b9ff08e4941f787dd81197fa5d3e')

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
      -DQT_NO_PACKAGE_VERSION_CHECK:BOOL=TRUE \
      -DINPUT_openssl=linked \
      "${additional_flags[@]}"
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
