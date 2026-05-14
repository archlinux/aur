# Maintainer: Martchus <martchus@gmx.net>
# Based on: AUR packages qt6-base-git and mingw-w64-qt6-base-git, official qt5-base package

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# This file is created from PKGBUILD.sh.ep contained by the mentioned repository.
# Do not edit it manually! See README.md in the repository's root directory
# for more information.

# All patches are managed at https://github.com/Martchus/qtbase

pkgname=mingw-w64-qt6-base-static
_qtver=6.11.1
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
        '0022-Export-some-constexpr-variables.patch'
        '0023-Android-implement-system-locale-in-QtCore-directly.patch'
        '0024-Android-refresh-QLocale-system-on-OS-language-change.patch')
sha256sums=('d9594a31228aa23ad6b531719a29b45f0f3989fe6c136d45767ea179f233c1ac'
            'fdfd25570db3e0dc0320734fb45bc36d4f3efe61bea75b463b3b2b01921fd967'
            '86e8d00e3b75f99b21a4d416532a20e93f92ccd7be95457105d8393aa9b0f4a7'
            'a1965ebe1d39a099729154f2e0b65625c79866f1836ffe04461741a767b3a876'
            '7ec1e631debfb5222c7cfdbe18bad0ef87b2dd611505b25960cd9d074a9b8938'
            '3e5f9550c89a3098eb9628a36c35660d3a84049240d54d1c5e4b25e62f3822de'
            'c7654b13f9dff5a43b4c57d4506810b812c65c80beb4429d9bdbf24b602ec2bf'
            'd03e8a33b8a757ccf3bac20eb61e91e7d59bab00fe14481f79a8181213c94928'
            '169fd1d7d994f6c36b54dce23d52626328a366f927939f5b96b3a0298376127e'
            '1a2be049189c0af10c1f68bf5be0a7ff3b2747a1ea6a03b40f44751708f62dde'
            '114f8b26ffaed24942187213357a0110a966e1c89883c2aa43eaa29c9610246f'
            '79d8bb70d59d9c98bb435808fe1b45b6662dbaac2c033e624e3c49f06ca966fd'
            '3c46b0718f5e39616d066a382b80170a3aecdc9070e400879daa2139b724d047'
            'd4c90b383ddf88e1f4eef05cd4367d3be52b358e432ca39257abb7ef072e0cf7'
            'd63498ca26d6c20fe8a8e8db615921c1b797b067b2d5d396d505c6ab9a3da010'
            'b501c200c6bd8712a1cc9c8094c41df100c279b056d0369e9c968f127ac4c0b2'
            'a79ef3b226edc7a2b0dc57c7284ca2c55c44770c633c48eeba7666ca64884782'
            '723ec21e1e9a0101aa6c99331f8af413ddab9d18aaf178b011356aff713737c2'
            '719d4e6439835add9d7d2883717d0be79ad82313a3fb35c2e21925ce30330270'
            '90f62a121e92b5e95c06a93c16dbe5169820d9dc0a1c4508b6ccf13e544fa6d4'
            'e172ba8f76e12308b12ac404a254d2584c08444d4e3df09b18f6d06b12ea2750'
            '8772a13917b437be2d733d3025812100996119f95d50ca8535b9149bf2a1d938'
            'e85a55fe00fc8d9ee2b78ace75770007bbddfece92451dc2c3568dd24d8f158e'
            '13fa456f70480df48e484cf406a9cce884b3a6c03ca0ea384793e5084505657c'
            '11a7f6ed72cb34ebffce4d994e1f4593286c43950957c9b74d5268e14b34c5fa')

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
