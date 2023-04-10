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
pkgname=mingw-w64-qt5-base-static
pkgver=5.15.9+kde+r150
pkgrel=1
_basever=${pkgver%%+*}
_commit=d3b21bc8b70eaa1af848371dc1d34c4617c1f73c
pkgdesc='A cross-platform application and UI framework, native OpenGL backend (mingw-w64)'
arch=('any')
url='https://www.qt.io/'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-libjpeg-turbo' 'mingw-w64-sqlite'
         'mingw-w64-libpng' 'mingw-w64-openssl' 'mingw-w64-dbus' 'mingw-w64-harfbuzz'
         'mingw-w64-pcre2' 'mingw-w64-zstd')
depends+=(${pkgname%-static}) # the static version relies on the shared version for build tools and headers
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
            'e3d31c0fa945b7f4aaf52216ea9d9a546592faf2920a4311b4551cb6e3998ebb'
            '50bfadae6febcd0354ba058d60a97830d17184e3521ab29d81ef8a8906af509e'
            'c27b36ae6f1e8ccdec4582887c5c6b2935c07cdee898ace2bf3f2f48fddb10e1'
            '0d5eda7272e4e7aada9fe05a7d2f4b9d83c1c208931a25d51d207cd7f6000b27'
            '58e46ed1aa3f53768070ba668eaf0bd482cdce81ed42bfd020dd1567bca2e96b'
            'e14d4e10a46d065d22ab923a4a743d17692d219064469130258e144944059f48'
            '4f95937fef0c8cfb233a879ad336bfbdf592e111078b18d77e62e61e8ee145c6'
            '76a34de588ff16f0bada68dffbb6532a7988a30ca78181d5f487dd7adc4450a3'
            '7a67391c8923f3322d1b4932865334cfd581db1ff5b061accbd6dad2ae6628ad'
            '4fea6993a009c79150362b000b1881e2a7b4a421ab20d1d79eabc01508a6ded5'
            'cc25f5191046825cb7b54fc83739ed5443bbfd060b5530d73f63d816f4998968'
            '46213add8069810b0397a9b99b4ca654b384829adc561831a2003bd85e482066'
            '69412355a54927761f957cc6defdfcb291eac1893fdc4ff39b56868ea44d9704'
            'd8ee421c868cc86e1a286162b13a75501b177d254a03a2101351d0e3f1843b52'
            '5295136bb5d3ff647653b3f91eb5b6f328a050f25df81ff59b9c2876a9db2911'
            '5116a0f0acac3e63b1c8f70108879e1cf326084b1295a395f4eb3e7554a20828'
            '558b8fe1c9893249c6d71ef5a4d1fe4a847dc05e4e8d11297591b0d701d57d55'
            'f3bfdf636da598fabfb8ef9a41c9d3ba6dd487c14bf9eb01ae23a25f3d8324c6'
            '21e8e8e8304ecf575c08f32f8b53a738c3b75f20a2113db583057f62475e1703'
            '7d226148335497fba9f19e497dec2e65c2d882bd958dbe1c7309c6fe0c9e1d4f'
            '20b5805e97743492cfaa9c1d6fc502e15e2887f07f31fe80069c7fb864f3b84f'
            'b71bce63d118de43ae486bb0c02a4f618d3c2edfbefc13185e821ce601029311'
            'dcd3ff314e8fdb0204dc95e2debf98bfd64e3532835f98824a3f0f5a915015d2'
            '1922ea83667a387b8a23564f1da721f9da827bde5da009d0938549f0301f8f0c'
            '62000eb6f623cf3e50912bbbdb55c0ee209c3f9a693570ad1e2131eb135e50b2'
            '9315034272921450841798c536e560481791cbd8daf5c19134200775e3f9a0e4'
            '0c476a0ee71ce50b9f4029b0ddb3c33bea03468fe3da44fa2e7615f55806a431'
            '247c17bbf8c2bccd0559e4974d5f05621eca8933d9e3d597b451a7ea54d12fc2'
            '00c81c93780321fdc9d7584bc2b860e8943f261faf296b59b159e15aa7ce945f'
            '8bfe3564e98fe2bb078ec612f7b2504497b0d068e26ac6f4ebe22f49c4da708c'
            'f00340c6bf0e1a7fdcce97bf2ef49e333fb961d0d59c16dcd7005d8824acaa65'
            '9d500a58350ee3c565eacc59b456a7a9ca0f1867d4611a7eccd74a0bc19a8762')

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
    qt_configure_args+=' -static'

    # configure static version to use linked OpenSSL
    qt_configure_args+=' -openssl-linked'
    export OPENSSL_LIBS="/usr/${_arch}/lib/libssl.a /usr/${_arch}/lib/libcrypto.a -lws2_32 -lgdi32 -lcrypt32 -ldnsapi -liphlpapi"

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

    # The static release contains only the static libs itself but relies on the
    # shared release for the bootstrap library and tools (qmake, uic, ...).

    # drop Qt5Bootstrap and libraries which are only provided as static lib
    # and hence already present in shared build (such as Qt5OpenGLExtensions)
    rm -f \
      "${pkgdir}/usr/${_arch}/lib/"{lib,}qt5main* \
      "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5AccessibilitySupport* \
      "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5DeviceDiscoverySupport* \
      "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5EdidSupport* \
      "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5EventDispatcherSupport* \
      "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5FbSupport* \
      "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5FontDatabaseSupport* \
      "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5PlatformCompositorSupport* \
      "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5ThemeSupport* \
      "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5OpenGLExtensions* \
      "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5PlatformSupport* \
      "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5WindowsUIAutomationSupport* \
      "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5VulkanSupport* \
      "${pkgdir}/usr/${_arch}/lib/"libQt5Bootstrap* \
    rm -r \
      "${pkgdir}/usr/${_arch}/lib/cmake/StaticQt5AccessibilitySupport" \
      "${pkgdir}/usr/${_arch}/lib/cmake/StaticQt5DeviceDiscoverySupport" \
      "${pkgdir}/usr/${_arch}/lib/cmake/StaticQt5EdidSupport" \
      "${pkgdir}/usr/${_arch}/lib/cmake/StaticQt5EventDispatcherSupport" \
      "${pkgdir}/usr/${_arch}/lib/cmake/StaticQt5FbSupport" \
      "${pkgdir}/usr/${_arch}/lib/cmake/StaticQt5FontDatabaseSupport" \
      "${pkgdir}/usr/${_arch}/lib/cmake/StaticQt5PlatformCompositorSupport" \
      "${pkgdir}/usr/${_arch}/lib/cmake/StaticQt5ThemeSupport" \
      "${pkgdir}/usr/${_arch}/lib/cmake/StaticQt5OpenGLExtensions*" \
      "${pkgdir}/usr/${_arch}/lib/cmake/StaticQt5WindowsUIAutomationSupport" \
      "${pkgdir}/usr/${_arch}/lib/cmake/StaticQt5VulkanSupport" \
      "${pkgdir}/usr/${_arch}/lib/cmake/StaticQt5Bootstrap" \
      "${pkgdir}/usr/${_arch}/lib/cmake/StaticQt5BootstrapDBus"

    # ensure config files don't conflict with shared version
    pushd "${pkgdir}/usr/${_arch}/lib/cmake"
    for cmake_dir in $(find . ! -path . -type d ! -name 'Static*'); do
      mkdir -p "./Static${cmake_dir:2}";
      mv "${cmake_dir}/"* "./Static${cmake_dir:2}";
      rm -r "${cmake_dir}"
    done
    rm -r "./StaticQt5OpenGLExtensions"
    popd
    rm "${pkgdir}/usr/${_arch}/lib/pkgconfig/StaticQt5OpenGLExtensions.pc"
    rm "${pkgdir}/usr/${_arch}/lib/metatypes/"*

    # create links to static plugins in lib directory
    pushd "${pkgdir}/usr/${_arch}/lib/" && ln -s "./qt/plugins/"*/*.a . && popd

    # keep a couple pri files not found in base
    mv "${pkgdir}/usr/${_arch}/lib/qt/mkspecs/qdevice.static.pri" "${pkgdir}/usr/${_arch}"
    mv "${pkgdir}/usr/${_arch}/lib/qt/mkspecs/modules/qt_plugin_"*.pri "${pkgdir}/usr/${_arch}"

    # fix bad library order for static CMake builds caused by Qt5Gui.static.prl
    sed -i -e "s|-lfreetype;|-lfreetype;-lharfbuzz;-lfreetype;-lbz2;|" \
            -e "s| -lz;| |" \
              "${pkgdir}/usr/${_arch}/lib/Qt5Gui.static.prl"

    # delete duplicate files that are in the base package
    rm -fR "${pkgdir}/usr/${_arch}/"{include,share}
    rm -fR "${pkgdir}/usr/${_arch}/lib/"{qt/bin,qt/mkspecs}

    # move pri files back
    mkdir -p "${pkgdir}/usr/${_arch}/lib/qt/mkspecs/modules"
    mv "${pkgdir}/usr/${_arch}/qdevice.static.pri" "${pkgdir}/usr/${_arch}/lib/qt/mkspecs"
    mv "${pkgdir}/usr/${_arch}/"*.pri "${pkgdir}/usr/${_arch}/lib/qt/mkspecs/modules"

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
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -delete

    find "${pkgdir}/usr/${_arch}" \( -name '*.bat' -o -name '*.def' -o -name '*.exp' \) -delete
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" \( -name '*.a' -not -name 'libQt5QmlDevTools.a' -not -name 'libQt5Bootstrap.a' \) -exec ${_arch}-strip -g {} \;
  done
}
