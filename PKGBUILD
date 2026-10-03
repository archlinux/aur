# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# This file is created from PKGBUILD.sh.ep contained by the mentioned repository.
# Do not edit it manually! See README.md in the repository's root directory
# for more information.

# All patches are managed at https://github.com/Martchus/qtbase

_android_arch=x86-64
pkgname=android-x86-64-qt6-base
_qtver=6.12.0
pkgver=${_qtver/-/}
pkgrel=1
arch=(any)
url='https://www.qt.io'
license=(GPL-3.0-only
         LGPL-3.0-only
         LicenseRef-Qt-Commercial
         Qt-GPL-exception-1.0)
pkgdesc='A cross-platform application and UI framework (android)'
depends=('java-runtime-headless-openjdk=17' 'ant' 'android-ndk' 'android-sdk' 'android-sdk-build-tools'
         'android-sdk-platform-tools' 'android-platform-37.0' "android-${_android_arch}-libjpeg-turbo"
         "android-${_android_arch}-libpng" "android-${_android_arch}-openssl" "android-${_android_arch}-zlib"
         "android-${_android_arch}-sqlite")
makedepends=('android-cmake' 'android-pkg-config'
             'java-environment-openjdk=17' 'qt6-base' 'ninja' 'patchelf')
optdepends=('qt6-base: development tools')
# note: Using the java-environment-openjdk and android-platform-X versions that match what is documented
# on https://doc.qt.io/qt-6/supported-platforms.html#android because using unsupported versions is not a
# good idea (see e.g. https://bugreports.qt.io/browse/QTBUG-119223 for Java
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
groups=(android-${_android_arch}-qt6)
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
        '0023-Android-infer-fullscreen-from-system-bars-behavior-i.patch'
        '0024-Update-md4c-to-0.6.0.patch')
sha256sums=('a951bd163c7b80fc6b8c88d7668fb56abf91c152373e13c10666763238131307'
            '252cdacdbd279b37c4abd2a4b58e42654b40562580fb68df1ce60938e5af882c'
            '35bca8c68203c1d23ff0c1598579a1299b88bc26b3c445f3a1f2eef7dc5bd907'
            '9da328c3c1e0f4c1db715fbd44c9f226c6309f081fbca2ab89c3a18c65355039'
            '32b84c8f3069673a98a92d75215d72a3ef7895b89f5635b5bec267233001c7fc'
            '22e3950068ce23ebfba9af290839b9a7c1ed9c722f527ac34d8e9c6eec2af5b7'
            'ece9f42579c3af7926ca480061dc64fc02a659276d686c8e6bf5f6db5fbbbee6'
            '65256a4c94678a95c14c5424c5b20f5b674717cda2be42a873fb859a68fe018f'
            '2abaeed5af3eb6ef3635cf83b9ebebaf4f6290a2b0c8af4f109bc0b39c788ac9'
            'ce6d75f3beb3645d5e081a031db70b6c321f65e728859293a80670cd8425536d'
            '81539a76880950b6c1d55375bdbab16bcbe9e661614409c361d627b6b3350bfa'
            '86fb41f6ce7d013f5be8f356006c7991ac6c0e1020e56370a2e4270f930fe69f'
            '8194b59b4cf373c6317a5b26fffd2bea6167021519b0b87c04da849f7f26479d'
            '5a325af2a90d49950e8564dac7bdbdadc7c5abce90cc2a5b829c3d646fe1b5a8'
            '5afd97293448245a384e67b78eca4fdf92bee0b5bfb9d7dc3c9684964cf99ce4'
            'aea0b6eb23576f3cc532afad4aa36bd4df4519c14011985ad001e33a7f21662e'
            'a222a820cedb599b79f12973896108518e907a5da6d6650e858d0558e19a8133'
            '2622218884ccb9dd9caa0c1c436cc1094b6e0c84b32945534402fde131e6c833'
            '27b430c81ed9871fe91880d47b946ee750cb97ac980e889bb66e0e894be7b37a'
            'fe76f21ca56ed7b9b55e32115172aa7341ce5d70381f742438e4a5cfe23186e5'
            '72683f76ce583b5847e57ef9885c8e93b18379ab8e345f53cd7b0f7079ad00c2'
            '6916214d8cfb4e3b75a931ebb5d089f29854f8e2c0a46ddf66fc4cd0b22250b4'
            '2492e4121a53b44ec6a9de192ed50215ca42a881f369e448c017b661208d6a48'
            '3da59cd7958ca76e2f943b498a88ca34ffd6123cf6657cd2d6d7ad11039e610e'
            '56a4bf3e41dae54db764060699bd5840c78bab1cd352397a094c6f6bfd148706')

prepare () {
  cd $_pkgfqn

  # apply patches; further descriptions can be found in patch files itself
  for patch in "$srcdir/"*.patch; do
    msg2 "Applying patch $patch"
    patch -p1 -i "$patch"
  done
}

build() {
  export PATH=/usr/lib/jvm/java-17-openjdk/bin:$PATH
  export ANDROID_MINIMUM_PLATFORM=24
  source android-env ${_android_arch}
  android-${_android_arch}-cmake -G Ninja -B build-$_android_arch -S $_pkgfqn \
      -DCMAKE_FIND_ROOT_PATH="${ANDROID_PREFIX}" \
      -DQT_BINARY_DIR=${ANDROID_PREFIX_BIN} \
      -DQT_INCLUDE_DIRS_NO_SYSTEM=ON \
      -DQT_HOST_PATH=/usr \
      -DQT_NO_PACKAGE_VERSION_CHECK:BOOL=TRUE \
      -DANDROID_SDK_ROOT=${ANDROID_HOME} \
      -DANDROID_NDK_ROOT=${ANDROID_NDK_HOME} \
      -DANDROID_STL="c++_shared" \
      -DQT_ALLOW_DOWNLOAD=ON \
      -DFEATURE_test_squish=OFF \
      -DFEATURE_pkg_config=ON \
      -DFEATURE_system_pcre2=OFF \
      -DFEATURE_system_freetype=OFF \
      -DFEATURE_system_harfbuzz=OFF \
      -DFEATURE_system_sqlite=ON \
      -DFEATURE_system_libjpeg=ON \
      -DFEATURE_system_libpng=ON \
      -DFEATURE_system_zlib=ON \
      -DINSTALL_DOCDIR=share/doc/qt6 \
      -DINSTALL_EXAMPLESDIR=share/doc/qt6/examples \
      -DINPUT_openssl=runtime
  VERBOSE=1 cmake --build build-$_android_arch

  # note: Avoid using `-DINSTALL_` options like in the regular package to avoid any problems with androiddeployqt.
}

package() {
  source android-env ${_android_arch}
  DESTDIR="$pkgdir" cmake --install build-$_android_arch

  # fix linking against SQLite
  patchelf \
    --replace-needed "${ANDROID_PREFIX_LIB}"/libsqlite3.so libsqlite3.so \
    "$pkgdir/${ANDROID_PREFIX}"/plugins/sqldrivers/libplugins_sqldrivers_qsqlite*.so

  install -Dm644 $_pkgfqn/LICENSES/* -t "$pkgdir"/usr/share/licenses/$pkgname

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/${ANDROID_PREFIX}/" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  find ${pkgdir}/${ANDROID_PREFIX} -type f -name 'lib*.so' -exec ${ANDROID_STRIP} -g --strip-unneeded {} \;
  find ${pkgdir}/${ANDROID_PREFIX} -type f -name 'lib*.a' -exec ${ANDROID_STRIP} -g {} \;
  [[ -d "${pkgdir}/${ANDROID_PREFIX}/share/doc" ]] && rm -r "${pkgdir}/${ANDROID_PREFIX}/share/doc" || true
}

