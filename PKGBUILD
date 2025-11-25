# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# This file is created from PKGBUILD.sh.ep contained by the mentioned repository.
# Do not edit it manually! See README.md in the repository's root directory
# for more information.

# All patches are managed at https://github.com/Martchus/qtbase

_android_arch=armv7a-eabi
pkgname=android-armv7a-eabi-qt6-base
_qtver=6.10.1
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
         'android-sdk-platform-tools' 'android-platform-35' "android-${_android_arch}-libjpeg-turbo"
         "android-${_android_arch}-libpng" "android-${_android_arch}-openssl" "android-${_android_arch}-zlib"
         "android-${_android_arch}-sqlite")
makedepends=('android-cmake' 'android-pkg-config'
             'java-environment-openjdk=17' 'qt6-base' 'ninja' 'patchelf')
optdepends=('qt6-base: development tools')
# note: Using the java-environment-openjdk and android-platform-X versions that match what is documented
# on https://doc.qt.io/qt-6/supported-platforms.html#android because using unsupported versions is not a
# good idea (see e.g. https://bugreports.qt.io/browse/QTBUG-119223 for Java; using a newer version of
# android-platform also did not work in my tests with Qt 6.7.2 and android-platform 35).
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
        '0016-Enable-minimal-and-offscreen-plugins-when-compiling-.patch'
        '0017-Allow-configuring-use-of-OpenSSL-in-QPasswordDigesto.patch'
        '0018-Drop-CMAKE_SYSTEM_VERSION-from-modules-json-if-Linux.patch'
        '0019-Workaround-linker-error-about-missing-symbol-__sync_.patch'
        '0020-Fix-Android-build-after-ec2e3e7ac92d000e0df0c693b9a6.patch')
sha256sums=('5a6226f7e23db51fdc3223121eba53f3f5447cf0cc4d6cb82a3a2df7a65d265d'
            '0f03776b94757fa171b10410870142627886f428a7d1c148eada92e4b378ea55'
            '0c2b64aa5fe1aef64ce2cf755451ec4759b88b073afb877468f4b507e9a1d205'
            '530461532946fce52c9c68aff1ba4ec9cb0a14a76ede5aad7715663900833b89'
            '766fdcf5f760007617c851293d6c500b04f74c3c2fd7d011d757d370c5d661fe'
            '532a54e7d952184ce3d57c0264a8e884bba6e5b42defea5caa7903c07b4a2a65'
            'c9aac3871b4cc8e362bf17ba32eafd7709e8d680cd0d21d43a4c43ee2e3fe452'
            '3c232d2b1f772d269ec0cb20862679b0691c35b36dac681d4d42cd9c11f059d4'
            '083a28fd5c64bdc65974c86d1c253bfd36bcba41e1b023a0ba6ca26167a54011'
            '49b3a49812aa4b52231e99c9989cb5b3fb27e4d465699ba96ba476a3d84f16a5'
            '0ce2efbddd69a9fc8cd23cf975663c5add4d1ec4d414436ebfbee3e5c9b131bd'
            '3e709a2e268e6d65ccd467d6c7b0f89b532070c8db72ff2a048a7ad0ac75067c'
            '8a69dfde420ac520616828d0eb81af6ede1f2d274807199c56549374f3ff58b6'
            'd4df5a66dbe460a5d17e3acc7e3007cb9d1a2815def091d65cb879763744058a'
            '498257c1b259e46bdf569b37d9c0bd3194751c4c35ec75b42b2deb15c171fc49'
            'c25f1941eac2241140f942fb6c1aad5509c94fb8e34008772259f1b01593d75e'
            '117ca3f87dad78d79cce494e42cd4395663c10e9ae6ef16f2789ed49b28a94fb'
            '13ce923c2735c2d7097330aea6d137237354469c4df1b04aba4e3ff12466ac6a'
            '74ca87c89118560aa6a4feaee9cd668996c17da7e66bc4e3ea6594f843e584ee'
            '760788b8eb19e876515e05b59381d322419ba9be3615e0da922a06c0f0d277ed'
            '6e1fb73a571158dca4c7d32e75ed71b1ea9beae2d3dfa7c67ba1d8f56d5a10e9')

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

