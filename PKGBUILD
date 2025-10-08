# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# This file is created from PKGBUILD.sh.ep contained by the mentioned repository.
# Do not edit it manually! See README.md in the repository's root directory
# for more information.

# All patches are managed at https://github.com/Martchus/qtbase

_android_arch=x86-64
pkgname=android-x86-64-qt6-base
_qtver=6.10.0
pkgver=${_qtver/-/}
pkgrel=1
arch=(any)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
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

