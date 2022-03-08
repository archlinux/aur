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
pkgver=5.15.3+kde+r133
pkgrel=1
_basever=${pkgver%%+*}
_commit=e68ca8e51375d963b2391715f70b42707992dbd8
pkgdesc='A cross-platform application and UI framework, native OpenGL backend (mingw-w64)'
arch=('any')
url='https://www.qt.io/'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-libjpeg-turbo' 'mingw-w64-sqlite'
         'mingw-w64-libpng' 'mingw-w64-openssl' 'mingw-w64-dbus' 'mingw-w64-harfbuzz'
         'mingw-w64-pcre2')
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
            'afba71c5989978f286179a49607976a35237496d86ac89be8757c899a40d537e'
            'b030be6a881a7e1398676079581b7aa72d439989eb1f19092630c43ce0ea95d5'
            '8f964778a3c1d88643e9264e883b8733a8c7b0f4b02cf939e90fdf68842caa98'
            '2bed971bda26f4f0dfec4cce6e3ced11c47b310de50672f68a0dda287a588849'
            'dfb2dff89fd4e40622212f042165156fa3ed2d469b6531f942199de33caad14f'
            'a12a73536da03752abbdb30d4a9cc969ff428e9e3152980cd021640f905ce03b'
            '254f0b967ba8084880542dcd27b7fb641d36969006d1f5f0da9d54e1969b30a1'
            'b8806f862bce296d55da97cb3273f6a7dcb92e7d1266b9610f88b994e1a3ad25'
            '6eb966cfeb80b5170fbd36e51f968a86d89dff532d1bef9daccbcf720b0474f2'
            '9da382aca0cf299d1f736c1adff9033706e4047be419264c6b9ae78370a04756'
            '7c8a923aa2bf5600c0f2993e4e869dab663f3dd2ab27c15035310c06661e4aed'
            'ee873b1f6a6e543cb288b39f135b6450f861f5ebcc8b4a7d367ea1bdb197170a'
            'b4ca4c64daf48cd1a7ca9d55e91d53294b719c50dd392ba84e0bdc1a8acc597f'
            '8f840fb187612cb28a94bd4a8083c83e29a42b2731e28f8686dcb37411cc69a9'
            '867e7ad44c2aac86f858d973a7af6514385a4f50d200f4259b30d470a3551b35'
            '13443e40d4a470219a2f6dc2dedcd988dd481ebe724f74fb5f1e7fa4fbe29e6e'
            '47b0f93c86108c03641efbdd97b54809a4ac0b575b86f27b7c6217e87320cda3'
            'fcac1dd8349e98b20ac4041856fd1d22c56326697fae5ab53e1823caeba10b01'
            'd4a31f994dbc39c9267bd2378f10212a5606a78d60956218349a4dc0faa4f215'
            '03dc0efe46cc96984c971e0e744bbf32cadc9fa65a58a9d6435f0ed59169409d'
            'd1432fe90e63616e898d7f0c541fe28588101230ca3fe2e20da39365967a64f4'
            'd9b68a39699e83674738d507bbe35290893085c8cee5f947ba74d3ef8eaa0a36'
            '6711df068cc141a72ec9a9d1d8d7afa0f718c2fe9799523d03ce47d1574efad0'
            'ea2d56b4f2eebd9a83c13706f9e4e37dfe4ba92af76195b97a81230734cbb300'
            'b872519418f451d8196fe22182a26994fb9b81c49ad6ca151b895e23e274cc7c'
            '4e7f7cfd9e0ab4f7251f32c5a6cf81b05e2435172f145b5caad64a5e12487116'
            'e69332fb658d70256ba232726db853d55372a4f45a5a5b9479a21a10fe807d67'
            '19c5cc4283416942f1575284357a3c3a74bc625f95aecb80d2a8dcc7d2d8c08f'
            'b924d45463042e345630b9d54460a8547749f3fa3a3ffb7de3c4e514e92a9a9b'
            '97657b673e434befb42ccb1c153d1094a6d1c23044eb7725aea3a64aaf2ec5b1'
            '562da92bdb7bf27dd44c2ae4f45381668fc80f1e8a0241b8c039c7e2884cfbae'
            '6cd22e4e73ecf402af473859aaedcb4ec62173605a2e4127d72ef73c6882b323')

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
