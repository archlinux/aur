# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: jellysheep <max.mail@dameweb.de>

# BEFORE COMMENTING OR REPORING ISSUES, PLEASE READ THE FILE `README.md` IN THIS REPOSITORY.
# ALSO HAVE A LOOK AT THE COMMENTS IN THE AUR.

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# All patches are managed at https://github.com/Martchus/qtbase

_qt_module=qtbase
pkgname=mingw-w64-qt5-base-static
pkgver=5.14.2
pkgrel=2
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
             'mingw-w64-vulkan-headers' 'mingw-w64-pkg-config' 'mingw-w64-environment')
groups=('mingw-w64-qt5')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
_pkgfqn="${_qt_module}-everywhere-src-${pkgver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${pkgver}/submodules/${_pkgfqn}.tar.xz"
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
        '0031-Prevent-Cannot-find-feature-windows_vulkan_sdk.patch')
sha256sums=('48b9e79220941665a9dd827548c6428f7aa3052ccba8f4f7e039a94aa1d2b28a'
            '14affce3bf8d6a2d2682e0cc7113a62fe851a62fcd5a76539acfe1f4b0c9ea4b'
            '96d750723b2e44fdb78520ebb369111391850554b55a4cb1c0a57299b97579fd'
            '4daa7399d1b8523cdf1446e2e4e3cefeaf8a1b14a467f808c3fda9e8e8516965'
            'ef4d333e7f0aa5bcfe1b4f67bf687f5ea2c9698189a0d001080783829c1b85bf'
            '54fcf347fe0355306b7ba122ff461c1153919908f89b1306ea50f4f8cf8c69f0'
            'e55dc7743472c72e58bf0ae780ca0a029670f075538a5c7c5658fe6742476985'
            'a5f5a87fc80182aeff9ea463c675243b91da432e02d0ca1e8d3b6f9f77013e4b'
            '1fbf437012eca9276178180a2cb15b6b0296553ca9304ae258b1cce6aed15bc0'
            '9a1d2f0f2059beeb70236e2f7ecbb2ef15e50644cb6a909a125306f067b3293f'
            '701bff16f7ad0809dbb61806c050d0742df10e125c24a841db8712e6146d6235'
            'dfba051c3fec6a77bcd07ebcd4d5e077d7b6fc7ae5291d0680820ac0cc320f2d'
            '8cc25ac98e8bff73fc980e4afc9e774569218145d2123808e14fe5d8649fe0d0'
            '8c0709d32c38a226116126ecf4d7fc71944fe3d6a42b8b5a27351e824ed445eb'
            'dfd12ab7e72b9721d16f902e97fe1c3379d20ae52633610c56d10bcb5e294395'
            '66c4cf8d218ee5582d6cf8836ed9916502e6ac5d4b77c46ee122460bb98f515d'
            'a5667634a5940620ca71cdc77c6e1ab656891c308d5053c25736e994ea4c78e0'
            'd82a344682f1290dfbc174ccdf35bbdeb4cf9f5418d3bfc664491451bb7a8229'
            'd10bbf540f58388557e5f39c447cff09ff1ddb733ea18f3d8678a308c478dbec'
            '8691b0a628c04e624d8d98680cb54814a46cd9af67168155a1c46bc9ecd5eafe'
            'a75a275232484eb616942731052552764348654b413225a334082635558def39'
            '4b8ceafdf29b045bcc3633c3b2f5682f925b9c79a73c738336e8c795201cbca0'
            '065ffac8cc7835f941fbbf355aa1ba63c1203c0491672ce7f99576198c0ee3eb'
            '567f9e136382f7373fd898d7699acc198767d2d5fa93375391826125aa7f7196'
            '389697028d0a704caffa06e47d70d9c2c3cd852616d5a4cad6e6482d5e3e7ff2'
            '90898fd84a95b03298d1eaa136459cd65b50957593e1e02a0c02be660097ddb1'
            'a4681e107f97cc802c1dc975c3118c492256e7baf398598061c7ae5ed3e1d65e'
            'e22cb9b06d182145433f4bbf7200273a009d62676570f476268ab8db2c23e36b'
            'eb409f1146c39f19d43fe71c103f40ec6c37d0760cae333f05146ca7e61b47b2'
            '8ee993247e7240947e5e8a549407ebbda2fa9e73c8310b41caff7da767012a6c'
            '03cb0da4cfe2315c4d8fc845e6a758f3ef6fc51883f993b3bf600653ab342579'
            '745e15a29bea515c0d65ddad01851e06c8ece5f1f18a0df871f09d5db55057fb')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

prepare() {
  cd "${srcdir}/${_pkgfqn}"

  # apply patches; further descriptions can be found in patch files itself
  for patch in "$srcdir/"*.patch; do
    msg2 "Applying patch $patch"
    patch -p1 -i "$patch"
  done

  # make sure the Qt 5 build system uses our external PCRE library and zlib
  rm -rf src/3rdparty/{pcre,zlib}

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
