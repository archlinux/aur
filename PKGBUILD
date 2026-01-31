# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# This file is created from PKGBUILD.sh.ep contained by the mentioned repository.
# Do not edit it manually! See README.md in the repository's root directory
# for more information.

# All patches are managed at https://github.com/Martchus/qtbase

_android_arch=armv7a-eabi
pkgname=android-armv7a-eabi-qt6-base
_qtver=6.10.2
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
        '0020-Fix-Android-build-after-ec2e3e7ac92d000e0df0c693b9a6.patch'
        '0021-Fix-inclusion-of-OpenGL-header-after-Qt-6-header.patch'
        '0022-Use-a-more-reasonable-fallback-directory-for-fonts-o.patch'
        '0023-Undefine-mingw-stat.patch'
        '0024-Export-some-constexpr-variables.patch')
sha256sums=('aeb78d29291a2b5fd53cb55950f8f5065b4978c25fb1d77f627d695ab9adf21e'
            '4e3664deeed9cad5a36b3a0c8a424666f15761b27edeb7c1d88d9e8c6180e4cd'
            'e4fb252c8411057d78d8a9db99535213342f3d014775905c5873ee9adb289b51'
            'e8a9751153224b4c3ebbe44b9c915384deaad323647c05f766da6b573493fedc'
            'cce050a3beaaab45ebcd280efd360fecb1218893d05d324f5640dc73b5dfe669'
            'c91ad27e0608b6ceeb41772055ac301c04231f38150eb5a77d34c8324377e373'
            'b5f3b11db1795502d9df739f9ce70919950ef28348340ee76feb19685454cbc4'
            '078a10549fb30d66e2506a1694783dc238467cdf7ee41aeb3d2e3d28f0ac7898'
            '193a246d06a3eb1fc74b8516bd682e2e73da9c6d39b10acf937c424df1ce9035'
            '30b9ef3e9eaa7159fb05958a2f1bdb88a492a7064175f0f2a4eba0992327afe4'
            '159f8fee1c3a199f2bdd72eb893ba4271c3b0149a34e8c45bfab0def55d1f3c5'
            'e9115b33492d3bbeebbd7e27861e438a7ed5b7849c5a56c9c43c273178c87391'
            'c19e24db24b1759907a0fb8b68dc0b204e1489b7d4b164b93330684fb28be404'
            '218a9d341f3f1fce5beb648be907fb168cd8550c6f34b7d90da3f9e3c054df8b'
            '19beffb348ea93463e84d8f5c738268eac560a3dc4a35a31651e252b0c218ca9'
            'eabd7e2e1333aba95f1b9ce840338b89a393c86f007b3a50453d036dc7a7bbef'
            '6a205d48f669b28f527ba8e2d2f4e67c544f6a02c16589482d2b2b824198df6b'
            'fbf25d0ff91ae30b95fbacb9c354997a51c4d2dd1c5d32263c541e56ba807133'
            'b70ae6aa150462a60af383994e23a74cba192452b675c313882a04601de19cdd'
            '13b6e54998864d0667c39e66076a1f9fb23a7fbcc84a5c1df0f6a05c578399bd'
            'a36d753b93690f52b523d99b055c032d3686ed2b0c8d73def315b6e2e8a0a0ee'
            '9c0c7f03791ea6144a3ba8da955423a270757020894ca4b63f8df6238180ebbd'
            '4f93ddcd38f0d2f4ee240e555841aab6857cbaecce4b1999bc51cc1417a5ccc1'
            '23c584af4d6b2bd776f894930efa8fa7b46deae67c65e0bbbfaff036253efe4f'
            '8c34f996f6915fda316ed2bb6253b4595c171236195076a5c211ad6b0e54178a')

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

