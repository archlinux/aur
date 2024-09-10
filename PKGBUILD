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
pkgver=5.15.15+kde+r127
pkgrel=1
_basever=${pkgver%%+*}
_commit=ab13e81917207959785ad0185a3a9974e552a7f5
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
            '22d381ba13ab64988e3e83e1d796319cfa63e62521ac380bc98a44cb4efd474b'
            'd2a78a1cee38821bba407c52cad12f715e5b3a6ea92c3420a47c70a6e5e68e5d'
            'cfc19a2cbf5a149fa1f8b71fecd464811dd908e9d42df41b1c8865109ee1e97a'
            '6aaba5c09a128923512d67115e438bcbd79990b1d70e9a3f02548eaa9990c497'
            '15da5fb4011f149a111df59518184fb6ea3c6c108580261d2698742b8cffc844'
            '0eafd7f37d748b42fc4cd6108b1a2960e4a052b8193b91138a20069714789cc9'
            '51b40da3b4135168ca796782bed17900e5e38820af50a13199f209bc0d274d7a'
            '4ffb27303ee723e56b7dd0b9f832ca5594c4bdfc2289647061ab7fef6f89798b'
            'c6b3fefccc4a4d22bad20ccdfb644ce8ee9a5c015b16c64e77a46c12178d4951'
            '955ba9e2f1f51eebd2c5245d8427b7240a4ac7694ad3f3f7a9167b5985263d7e'
            '9f1abc78715c37fe637a2a79a47b41bc110ad1d08cab5b3f00341d427eb70b65'
            '11a208d19c567f87ec8318c7db69b6d7fd516dbc9ee2d3209a8b0a0fc16b41c5'
            'f91a26760166f7bcfc8d7deac5f8c9f2a8102d05568ec208fa18056b2f4ef6f5'
            'b025867eef51acdb3f65005463bdf9818c1bdc096b029425f16665c011cfed7d'
            '5b03f4307bb076727dde14d7efbf8290ab183fa45a544fa92858b315e60f1ebd'
            'a79ae6f052f2b6ad7255a4cd875ba7ec81b142bddd270c78f786ec65d0646799'
            'fe5dbb469beaa8c1ef61bb408ab2fcc9e2df1e81225333fdebb908ead38bc308'
            '28f7cbef809822a6c6c698468b2308888e8ffb7b649cea8a75240bb445c4f24d'
            'bf46e868c2c8e6072367ea851d7a8a6d31969f372b337436f16f3141fc850873'
            '9b0f0b4649f1e0d7c544e502f640c72a68dae9a667961f9ac1e792ffbfd2eaaa'
            'cc0aba877cbc4da6d7840fb007128b94bb2c9fb396ab2316dd9b931cbe5a0ef9'
            '687a68dd1de6fdcf0aa55da727cce269782661cc78cdf2f36597986f60c9b4a9'
            '1d829b537884086d8b6552742717b79f59da3321a4d273ee71b2303e6a4c7823'
            '321c128b4cd5f45e61d8225832a6cc9e68969aaa2e2eb567c511d2947b29f003'
            '71d2e6dfb765dd69b98b3b851e4683acc51fc7069fe8d158d30f8beb12a467a2'
            '5cbd3c1e92a7c2f50516855ee59a3f63e447079e099c0d655e721a2f69423242'
            '6f66dffca0f80a97428584a55dcf405f6172a088058c1b011b092d8f68e0f34a'
            '1d8c8f49b61dedb0dc48291748ca6d055e0fcfbfe02483e9279a3661231686d1'
            '017eb5246c624093c8e5396495427a91cf2f18228d3dd073dd9c033794f64d27'
            '2334a67614e7e3c670225056f9b197ef0a3c4c7e97ea07f278371c82e8acae29'
            '9eedc6b76a7f3111f905a6406d407fb7c33629b7f45361388274bba596ca90f5'
            '773739cb8fadcfd70381103a4ee591d970a22c2cb27aae8fcb034e154b5e4af2')

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
