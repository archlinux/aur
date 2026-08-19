# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# This file is created from PKGBUILD.sh.ep contained by the mentioned repository.
# Do not edit it manually! See README.md in the repository's root directory
# for more information.

# All patches are managed at https://github.com/Martchus/qtbase

_android_arch=aarch64
pkgname=android-aarch64-qt6-base
_qtver=6.11.2
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
        '0016-Allow-configuring-use-of-OpenSSL-in-QPasswordDigesto.patch'
        '0017-Workaround-linker-error-about-missing-symbol-__sync_.patch'
        '0018-Fix-Android-build-after-ec2e3e7ac92d000e0df0c693b9a6.patch'
        '0019-Fix-inclusion-of-OpenGL-header-after-Qt-6-header.patch'
        '0020-Use-a-more-reasonable-fallback-directory-for-fonts-o.patch'
        '0021-Undefine-mingw-stat.patch'
        '0022-Export-some-constexpr-variables.patch'
        '0023-Android-implement-system-locale-in-QtCore-directly.patch'
        '0024-Android-refresh-QLocale-system-on-OS-language-change.patch')
sha256sums=('5b2e00eccaf5a4d8c14134ffa0ea8dfd0a35ae1ffc7f8d87fa4305a1ed23cf22'
            'cc4ff752ac033a11d631ca9180ce6f39523b28eb27e834b0534caf73952f3cf7'
            'b48e60a5b8e24432d01924402c026f0a4004177b7e680d83c3987b4570f2b284'
            '117fe973b3e6b17014138a30629bac47f91d27a74c95d261be946c4a6aeebffe'
            '76b7f7f1c3e2429ea74bd266b7753805b71e15d34252b06703fbd949f8f31e3f'
            'af167d2a004c1ff4ee4d7509c6b581c797c04333bccd511057d2cd58bca6e089'
            '8c42b1d72698d50751fe7d1270193f5e79c9cfd671e3bd5414097437e3c8db74'
            '92a1a35ad095e28a82820a3f0fade527b3683948202c8e279e3c36bc0e05822c'
            'b07bed8ef73101dcc816fe1ce30ae7252351aed7bb10572507bee9e65f03c230'
            '8d2f2af81e287c22417dcaa4df40ff87f02501154fe44d3407be790a9d270783'
            '9aea38c65b0b476ce96f8f4e58204a8a4c975ca4cb7dd6501d3336fd7bd8762a'
            'e0f5d4a25ba5c959d1210725a04c2d5ac59c1a4366a7e84fbcd8243ee52a87ab'
            'e771e0404318d0b1e137edaf2531ebcc4880f5478fc0a13fb4ef987644e46aa2'
            '740c49b68612b4bfbeceabc6266805bd080d698991086804ee9f499f1e775e20'
            '4f1deb2e228a94857d168593c66ab779855334e62a0317741b745af04ee34094'
            '6b8c45cf760f86f3c2a84641b649215663bdf7ea0845f36145d78eebb857b1f2'
            '9990966223cbceec606d195766f85125e6baac36d454eabbbe229e9a009d2b8f'
            '62e2cf65879293591b8c7585dbfc40d6fd82666d244dacd8d7359d6c1546fac1'
            'aa7cfaf54af6a689b7da4b7b0eac361cef1b61cae658c5db2ae9f36d38b41ade'
            '6a23930295688d93d74282dcad00cb4146b9740aaf45f7f52de18479e78b3766'
            'ea524603aff016b9c4e9f410277dbbd82956e34d48b504f6c6ee6236fdb9b88a'
            'f22fe4289a17e298beefbd0e7f2344995e4c79767adc79ddc82094adf9e7faf0'
            '63a7aa670df8bfb0a1d5811dd024c85f94609502188df6ce9b278c96d0c03dc1'
            '2aeee29947e7a4c2750f6b7fbf7dab6a0ecf14c18e0119996eff0c89d2f7aa3f'
            '9c9922a48c88a237dd98297615bcf68c05fabdecc2a227073e15a37ba1c0ed63')

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
