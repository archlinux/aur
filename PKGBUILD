# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: jellysheep <max.mail@dameweb.de>

# BEFORE COMMENTING OR REPORING ISSUES, PLEASE READ THE FILE `README.md` IN THIS REPOSITORY.
# ALSO HAVE A LOOK AT THE COMMENTS IN THE AUR.

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# This file is created from PKGBUILD.sh.ep contained by the mentioned repository.
# Do not edit it manually! See README.md in the repository's root directory
# for more information.

# All patches are managed at https://github.com/Martchus/qtbase

_qt_module=qtbase
pkgname=mingw-w64-qt5-base
pkgver=5.15.12+kde+r147
pkgrel=1
_basever=${pkgver%%+*}
_commit=8907dedc858cc344d770a2e826d6acc516429540
pkgdesc='A cross-platform application and UI framework, native OpenGL backend (mingw-w64)'
arch=('i686' 'x86_64')
url='https://www.qt.io/'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-libjpeg-turbo' 'mingw-w64-sqlite'
         'mingw-w64-libpng' 'mingw-w64-openssl' 'mingw-w64-dbus' 'mingw-w64-harfbuzz'
         'mingw-w64-pcre2')
optdepends=('mingw-w64-mesa: use LLVMpipe software rasterizer for Qt Quick'
            'mingw-w64-postgresql: PostgreSQL support'
            'mingw-w64-mariadb-connector-c: MySQL support')
makedepends=('mingw-w64-gcc' 'mingw-w64-postgresql' 'mingw-w64-mariadb-connector-c'
             'mingw-w64-vulkan-headers' 'mingw-w64-pkg-config' 'mingw-w64-environment' 'git')
groups=('mingw-w64-qt5')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
_pkgfqn=${_qt_module}
source=(git+https://invent.kde.org/qt/qt/$_pkgfqn#commit=$_commit
        '0001-Adjust-win32-g-profile-for-cross-compilation-with-mi.patch'
        '0002-Ensure-GLdouble-is-defined-when-using-dynamic-OpenGL.patch'
        '0003-Fix-too-many-sections-assemler-error-in-OpenGL-facto.patch'
        '0004-Make-sure-.pc-files-are-installed-correctly.patch'
        '0005-Don-t-add-resource-files-to-LIBS-parameter.patch'
        '0006-Prevent-debug-library-names-in-pkg-config-files.patch'
        '0007-Fix-linking-against-shared-static-libpng.patch'
        '0008-Fix-linking-against-static-D-Bus.patch'
        '0009-Don-t-try-to-use-debug-version-of-D-Bus-library.patch'
        '0010-Fix-linking-against-static-freetype2.patch'
        '0011-Fix-linking-against-static-harfbuzz.patch'
        '0012-Fix-linking-against-static-pcre.patch'
        '0013-Fix-linking-against-shared-static-MariaDB.patch'
        '0014-Fix-linking-against-shared-static-PostgreSQL.patch'
        '0015-Rename-qtmain-to-qt5main.patch'
        '0016-Enable-rpath-for-build-tools.patch'
        '0017-Use-system-zlib-for-build-tools.patch'
        '0018-Merge-shared-and-static-library-trees.patch'
        '0019-Use-.dll.a-as-import-lib-extension.patch'
        '0020-Pull-dependencies-of-static-libraries-in-CMake-modul.patch'
        '0021-Allow-usage-of-static-version-with-CMake.patch'
        '0022-Adjust-linker-flags-for-static-build-with-cmake-ming.patch'
        '0023-Use-correct-pkg-config-static-flag.patch'
        '0024-Fix-macro-invoking-moc-rcc-and-uic.patch'
        '0025-Ignore-errors-about-missing-feature-static.patch'
        '0026-Enable-and-fix-use-of-iconv.patch'
        '0027-Ignore-failing-pkg-config-test.patch'
        '0028-Prevent-qmake-from-messing-static-lib-dependencies.patch'
        '0029-Hardcode-linker-flags-for-platform-plugins.patch'
        '0030-Fix-linking-against-static-plugins-with-qmake.patch'
        '0031-Prevent-Cannot-find-feature-windows_vulkan_sdk.patch'
        '0032-Fix-crashes-in-rasterization-code-using-setjmp.patch')
sha256sums=('SKIP'
            '6abea753da212719c065ba5001380257098fcb78ebfb1743d511c827f470a636'
            '19b2918d73c1fe63c284602e9315e22d0c9b3240705b8a6459f2b0967933c969'
            '23d6ace78834c831ea97e19b443a88291e4d103fd85da920e1cf430047a73d41'
            '66924a2642debb2a76ff085c1c2c4a6912993d313efea392308859edc825672c'
            '306cc84dbb13f1315b6d060dffbca4d4a9637f9672e43c58a3d01bf766ae3f71'
            '167a7c2cece750b7da922ec25e47eed618feaca92897d085a0c635f828b1a9b9'
            '9667d35f3beb5c9042bd7190342f8e86bc9ff62f0bcbb438e25450025c1cf597'
            '09c6de90337c1a8d42e695fdea53bdea9800e9d7fc8d12578e9fb1fd564988cc'
            'b5442e2b87f39defa6e38793b2fd26c1e0f3610ae02b3d14a4b680e687ca2ccc'
            'c3c3c0f651da11e3b78cf71399a0d95519e9dc0361e9732adc7f36d60c9e45c1'
            '561c0ec6fce7f61166097ea7037020b657dc21abb3fbbf136318f0d43940c396'
            'e80f2dedaf91bd3302c27244451a510ba3a576bb60d6e96a0f3c8ad8bd0fbd68'
            '0d77c5d3f9e84fa2dff90c5faf32b51b1b19f110a503fa9630cdc5e33bc6d72e'
            'c49304f8c99bc4213dc62a65f7f8d1089b72c7ec49d8895afaf5d059da7b905f'
            '3eb93b2fb1b6eb5e6f5d4fff8e75e5b0cfab96503b077c121e4bc405eda08f42'
            '16cc6c9c49d91e2a6c8c6e53a7305db868f4080affd387ec3d932fa474b5841c'
            '06fb708234c783bc1aa9e0bf1f9db6f16b3fe62ee8a94300252796de841fd56d'
            '1ab92232b3a94446c391c822a82aab767f4b1b077c73e839b316473163887ad4'
            'b174ddca0726fadf191176336f8fbddf18ab95f2967e1e0bebdb8e0425d4223f'
            '376aebad348858696a4f8ecaf9668cf4b12687ef2213706e768d8aa11a01e631'
            'f266866a8f01cb95a1d686b1a5ce3ec46ab8fa0ddec268b0e2eb53ddbf53aae3'
            '91730e65dee6d4a3b1c36e2153c0608e9fb419060ccb57800452895cfe5e08c3'
            '575c14e7ff04515a934491fcfd0328316f734045a419581b356db9e9dbd69d20'
            'a1c8251c4d9747fdfb2fa319cbef604bec6f3826ca4b0d2277b3e56b24e1d44a'
            '40419107bdd48d47c8d5c8cbee3624fd14c32e2daa42993ff08ea9d5eae21d0f'
            'af7f4c80119c33607d142a591dcf86463796526333a964f7dee5813eab7a2705'
            '1684c496c58ecff4fc5e21335a96824ee07282479d0d5f7edf52e844264ce76e'
            'f610d74cffc6c2d089eedde8f31624da25172cc9825a24c085ff6e9c80cb3352'
            '30decf5cf1c862c183350ac9af71263ecd45a9701d9e85bc765af8e74ddd0df6'
            '811ad201d74106dea202ce28806dc1eca091139da5a71d2dd8656c592ec721ed'
            '8a154c511e6e3e35a64338890edbbc2a12d6a7079fff9a14491146a4b66e5b59'
            'c2a61b245c312b71c043ee274d7beba0daf213d7a6f6ba748c2965e4dc27ff0a')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

pkgver() {
  cd $_pkgfqn
  echo "$_basever+kde+r"`git rev-list --count v$_basever-lts-lgpl..$_commit`
}

prepare() {
  cd "${srcdir}/${_pkgfqn}"

  # apply patches; further descriptions can be found in patch files itself
  for patch in "$srcdir/"*.patch; do
    msg2 "Applying patch $patch"
    patch -p1 -i "$patch"
  done

  # clear buildflags ('!buildflags' only effects build() but not prepare())
  unset CPPFLAGS CFLAGS CXXFLAGS LDFLAGS PKG_CONFIG_PATH

  # build qmake using mingw-w64 {C,CXX,LD}FLAGS
  # * This also sets default {C,CXX,LD}FLAGS for projects built using qmake.
  source mingw-env
  sed -i -e "s|^\(QMAKE_CFLAGS_RELEASE.*=\).*$|\1 ${CFLAGS}|" \
         -e "s|^\(QMAKE_CXXFLAGS_RELEASE.*=\).*$|\1 ${CXXFLAGS}|" \
         -e "s|^\(QMAKE_LFLAGS_RELEASE.*=\).*$|\1 ${LDFLAGS}|" \
    mkspecs/common/gcc-base.conf \
    mkspecs/common/g++-win32.conf
  sed -i -e "s|^\(QMAKE_LFLAGS_RELEASE.*=\).*$|\1|" \
    mkspecs/common/g++-unix.conf
}

build() {
  cd "${srcdir}/${_pkgfqn}"

  for _arch in ${_architectures}; do
    # define general configure arguments
    local qt_configure_args="\
      -xplatform win32-g++ \
      -optimized-qmake \
      -verbose \
      -opensource \
      -confirm-license \
      -force-pkg-config \
      -force-debug-info \
      -system-zlib \
      -system-libpng \
      -system-libjpeg \
      -system-sqlite \
      -system-freetype \
      -system-harfbuzz \
      -system-pcre \
      -no-fontconfig \
      -sql-mysql \
      -sql-psql \
      -sql-sqlite \
      -dbus-linked \
      -no-glib \
      -no-icu \
      -iconv \
      -nomake examples \
      -make tools \
      -hostprefix /usr/${_arch} \
      -hostdatadir /usr/${_arch}/lib/qt \
      -hostbindir /usr/${_arch}/lib/qt/bin \
      -prefix /usr/${_arch} \
      -bindir /usr/${_arch}/bin \
      -archdatadir /usr/${_arch}/lib/qt \
      -datadir /usr/${_arch}/share/qt \
      -docdir /usr/${_arch}/share/doc/qt \
      -examplesdir /usr/${_arch}/share/qt/examples \
      -headerdir /usr/${_arch}/include/qt \
      -libdir /usr/${_arch}/lib \
      -plugindir /usr/${_arch}/lib/qt/plugins \
      -sysconfdir /usr/${_arch}/etc \
      -translationdir /usr/${_arch}/share/qt/translations \
      -device-option CROSS_COMPILE=${_arch}- \
      -device-option CROSS_COMPILE_PREFIX=/usr/${_arch}"

    # allows using ccache despite the use of pre-compile header (sloppiness must be set to pch_defines,time_macros in ccache config for this)
    qt_configure_args+=' -device-option CROSS_COMPILE_CFLAGS=-fpch-preprocess'
    qt_configure_args+=' -device-option CROSS_COMPILE_CXXFLAGS=-fpch-preprocess'

    # add include directory of freetype2 and dbus manually (pkg-config detection in qmake doesn't work which is currently ignored via a patch)
    qt_configure_args+=" $(${_arch}-pkg-config --cflags-only-I freetype2 dbus-1 | sed -e "s/-I\/usr\/${_arch}\/include //g")"
    # note: The sed is required to prevent -isystem /usr/${_arch}/include (qmake will turn -I into -isystem) which would lead to
    #       the same issue as here: https://github.com/Martchus/tageditor/issues/22#issuecomment-330899141

    # enable debug build if MINGW_W64_QT_DEBUG_BUILD is set (could be set in eg. /etc/makepkg.config if debug build is wanted)
    [[ $MINGW_W64_QT_DEBUG_BUILD ]] \
      && qt_configure_args+=' -debug-and-release' \
      || qt_configure_args+=' -release'

    # configure usage of ANGLE/OpenGL
    msg2 'Using native OpenGL backend'
    qt_configure_args+=' -opengl desktop'

    # add include directory of MariaDB
    qt_configure_args+=" -I/usr/${_arch}/include/mariadb"

    # add include directory for Vulkan
    export VULKAN_SDK=/usr/${_arch}

    msg2 'Configure and build qmake'
    mkdir -p ../build-${_arch} && pushd ../build-${_arch}
    qt_configure_args+=' -shared'

    # configure shared version to load OpenSSL dynamically
    qt_configure_args+=' -openssl-runtime'

    qt_configure_args+=' -device-option CROSS_COMPILE_CUSTOM_CONFIG=actually_a_shared_build'

    # override LD_LIBRARY_PATH so libraries for native build tools like libQt5Bootstrap.so are found
    #export LD_LIBRARY_PATH="$PWD/lib"
    #export LDFLAGS="-L$PWD/lib"

    msg2 'Build qmake and configure' && ../${_pkgfqn}/configure $qt_configure_args
    msg2 'Build Qt libraries'        && make

    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/${_pkgfqn}"
    make install -C ../build-${_arch} INSTALL_ROOT="${pkgdir}"

    # use prl files from build directory since installed prl files seem to have incorrect QMAKE_PRL_LIBS_FOR_CMAKE
    pushd "$srcdir/build-${_arch}/lib"
    find -iname '*.prl' -exec cp --target-directory "${pkgdir}/usr/${_arch}/lib" --parents {} +
    popd
    pushd "$srcdir/build-${_arch}/plugins"
    find -iname '*.prl' -exec cp --target-directory "${pkgdir}/usr/${_arch}/lib/qt/plugins" --parents {} +
    popd

    # remove DLLs from libdir (DLLs are installed in both bindir and libdir, one copy is sufficient)
    find "${pkgdir}/usr/${_arch}/lib" -maxdepth 1 -name "*.dll" -exec rm {} \;

    # install missing libQt5BootstrapDBus.a manually
    cp --target-directory "${pkgdir}/usr/${_arch}/lib" "$srcdir/build-${_arch}/lib/libQt5BootstrapDBus.a"

    # create symlinks for tools
    mkdir -p "${pkgdir}/usr/bin"
    for tool in qmake moc rcc uic qdbuscpp2xml qdbusxml2cpp qdoc syncqt.pl; do
      ln -s "../${_arch}/lib/qt/bin/${tool}" "${pkgdir}/usr/bin/${_arch}-${tool}-qt5"
    done

    # create qt.conf containing plugin path, see https://github.com/Martchus/PKGBUILDs/issues/109
    echo "[Paths]
Plugins = /usr/${_arch}/lib/qt/plugins" > "${pkgdir}/usr/${_arch}/bin/qt.conf"

    # drop QMAKE_PRL_BUILD_DIR because reference the build dir
    find "${pkgdir}/usr/${_arch}/lib" -type f -name '*.prl' -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

    # remove doc
    rm -rf "${pkgdir}/usr/${_arch}/share/doc"

    # remove prl files for debug version
    if ! [[ $MINGW_W64_QT_DEBUG_BUILD ]]; then
      for file in $(find "${pkgdir}/usr/${_arch}" -name '*d.prl' -o -name '*d.static.prl'); do
        [ -f "${file%d*}${file##*d}" ] && rm "${file}";
      done
    fi

    # remove '.static.prl' files
    find "${pkgdir}/usr/${_arch}" -name '.static.prl' -delete

    # replace library path in *.prl files so it points to the installed location and not the build directory
    find "${pkgdir}/usr/${_arch}/lib" \( -type f -name '*.prl' -o -name '*.pc' \) -exec sed -i -e "s:${PWD%/*}/build-${_arch}/lib:/usr/${_arch}/lib:g" {} \;

    # strip binaries, remove unuseful files
    strip --strip-all "${pkgdir}/usr/${_arch}/lib/qt/bin/"*[!.pl]
    strip --strip-debug "${pkgdir}/usr/${_arch}/lib/libQt5Bootstrap"*.a
    if [[ $NO_EXECUTABLES ]]; then
      find "${pkgdir}/usr/${_arch}" -name '*.exe' -delete
    else
      find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip --strip-all {} \;
    fi

    find "${pkgdir}/usr/${_arch}" \( -name '*.bat' -o -name '*.def' -o -name '*.exp' \) -delete
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" \( -name '*.a' -not -name 'libQt5QmlDevTools.a' -not -name 'libQt5Bootstrap.a' \) -exec ${_arch}-strip -g {} \;
  done
}
