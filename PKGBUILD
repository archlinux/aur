# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# This file is created from PKGBUILD.sh.ep contained by the mentioned repository.
# Do not edit it manually! See README.md in the repository's root directory
# for more information.

# All patches are managed at https://github.com/Martchus/qtbase

_android_arch=armv7a-eabi
pkgname=android-armv7a-eabi-qt6-base
_qtver=6.9.2
pkgver=${_qtver/-/}
pkgrel=1
arch=(any)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='A cross-platform application and UI framework (android)'
depends=('java-runtime-headless-openjdk=17' 'ant' 'android-ndk' 'android-sdk' 'android-sdk-build-tools'
         'android-sdk-platform-tools' 'android-platform-34' "android-${_android_arch}-libjpeg-turbo"
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
        '0024-Drop-CMAKE_SYSTEM_VERSION-from-modules-json-if-Linux.patch')
sha256sums=('44be9c9ecfe04129c4dea0a7e1b36ad476c9cc07c292016ac98e7b41514f2440'
            '53092668a3cf64a4ffb06eaf915ac4a0b920f76d860c723b253332ce1d91aeee'
            'f2c6ef1e5d91ee24d79c8bed8f7a63a858694a086f933956bdff034b12cc4c2e'
            'a8f789ddf002c1b38288a1dc87a4a0158008c4568a6c836f9b69957d4318ba5f'
            '2f8dbf0d123224991fabe99966bc1fcffc229b931872325a2d9b33b0cea2d364'
            '2d98422ed694034a7427d01573e0db7c0581c8197fcecc9ee17a1e3b6b537147'
            'cdc15291f6028c0b47614ea9b5a9e42368ca62d6d54ea54ec9f44ad429915198'
            'b099aca1dff621fec47ae93ef0c7797876db03224f3b13a8b9d6bf14bb5005ef'
            '4ff88e9c84be974db03f5aac7554f79b44b8d20279e85ed33c38d6c8019e6fad'
            'd2727e5bc5ee241ab159140d81a31455c387987882395c321ac40d4c769a4abc'
            '70d69b8532383a15b12e701540116b404131b04ac47ea45bef64b5e4460be757'
            '0aeb1086fc06a3d5338818d7ae924f3fccb02c02abcf9fd2c0df3d2342e89b33'
            '4a44a0690530bddf0acda8eaf14076c32d470a0b1a769db82c8a49fbd5f1f4ee'
            '69873f1a8628510489a4558de4ceb526b6e38c289079fdd434cae03705653c66'
            '1d1b9aeded465852e696bceec44b9b707af8ca5873d2ec69aba039d7673184bd'
            '35021cf6f5fef941a61723120ca35d149a1065cb2c52b491dc4d6fa551e3748a'
            '9c3940080fbc3e1b0a8fa8ce4cc36b4c8fa44cf0a7436fe03d3dd646e659f2b5'
            '5104913129e1c4530c21e0e3d1a419b80853f27761824b3c584b3f6737c1bc12'
            '83ead37aba92fcb5637fa075fe80ef9436c43392ce89ca241ab0fdfaafa7c494'
            '707964b22f9c0dd0bff13eacf29c47dfbea201caaf307acbc7abfe82361c984a'
            '41b950f1a064700f813ded288e51faa89a57c3bd0fe3c561780e237a112e2d18'
            '3d5c64f93fb0fcedb12d2f75a01df2c2c687457afc46d499a8c0f1cca26ca257'
            'ccf9e8569222ac3d57d6d7090cb6b7e446d13a2177e0e5508806fa0fab498670'
            'e84911790825bbad48c3947f7399d280a41222afa79d3751e5fe0ce10aec6561'
            '54b5cf672f20969167bcc442aa2d41ec9741a1413c5b27b271db958b4ad048a7')

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

