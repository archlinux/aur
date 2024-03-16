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
pkgver=5.15.13+kde+r138
pkgrel=1
_basever=${pkgver%%+*}
_commit=b9906b5233a80cab372c95ac4dd68b25bdca0646
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
sha256sums=('06e49a14145574834d4d04f73e6baf662ee5e72e78973e1d7d0fe614472a80a4'
            '11c2b54df2b5ea031c2103366d0b27d0786c3420b29cca391cc0015fd35264d7'
            '2b00e98c8c8acb1a453191be77a2f7a9188e030480864e58ac39b517bb63ffb5'
            '5131dff4db6f63e36ea364ce59b2fdb047fbb6d55e6543316054f6ebcd76711b'
            '3147a21ccad3026a06d8b622db96949d51f32b6a1d25c8aae5fe5a95c3e95625'
            '4bd74cc1d78da412faac71b5357fd86fea3f1781d0b554f8f7fd3684c833e8ce'
            'e566e5cdd5bc077c35054be1465148acd5ee209e609690c670b78df88cc9295b'
            '7fe1dc6c1251c16c4236924cb5a03ac55d1dca051bd9d99fbf7b35f91454fda3'
            'c054851c46036710ff6f025a48d4b5b2d6e5d5d54c74b73c2cb81b00bdfa029a'
            'a2702d6ca3f696ca3c77b00df7bb512f5f3430fce109048c62c97d294758efd8'
            '395339c3dde4115283db948899980e536a355422190bc90850efdc3438c527d8'
            'c386790a879e68b9d00bfe9f14afa67d8a374de57bdea164a5252499ec34cbcb'
            '576177950e99f62d05bee487dd5ae1b731fe4acf438553c74e7c48631dd8789b'
            '02bc0ce27d7835829d4e84580fb0a0b864b36b14331a166dba88f1942a6414a3'
            '736de6cd28c8efb1729f926c1fa42c963c7f1d3a9e4b56b098906b570473320f'
            '294f3ab13a546a1bfeae472cf7342e2bce6c058a6867d19038ba1c194fb33b8d'
            '8f202adf905ebce78dd2942d17c0d935f0de7014ffa75840310edc0bd790ff03'
            '129b4667c5e3cfe68040cbae2fce487e2d016bcbe2380a5ba410b225279f71b9'
            'fbd8cd4680e10074f90bf79d9d08ad787b483cf7c21250d1db1c8a5c829a1d83'
            '05a29084b9bc3324beefb9ae6d00ea68c3b3c51a0b4595c024300949c906d7fd'
            '7843f5be44b9b367cb81c143c6d670e6a5be40510848c09a1448d921c3437639'
            '7002db8f819bf34cafda04dc4d288fef58aec9e409230dc68fcb542cb48f09bb'
            '57607c662e6d68f2ca856617c8d7cfaa05ba8332ea70b67ab628a8f0cf2ca032'
            '5910c4567348101d0a87197b2e52e59673467247ca4ffc89cba5701d98373435'
            '0181986547b7c70bf2bc8de31198240f99a92e4cfdb1db81c7b99b849c416c1f'
            '9e692f956dffa5c936a2911d8418746b19197962111b4f0f45b33972ed3890f2'
            '1d5e09034c9c903653d10c3983e4dcb710ebe8f08694e5e55199a3e4acb8f629'
            '5379cea6fd54a16e7f67b617bf3582c08f8934ae8d699e85ad21f20dcf192424'
            '82d1db9d4536350fe2549c400487018a8477a15da83a568240a013a6d82dfe92'
            '01413344603a8e99f7b0280e7f297de4ea415e0c5011b1dac116eaf25082220b'
            '4f88801a586c35515fd982f8e465fb4546ef38765c6a2abe1e8ca69e3700d799'
            'b4dad74bbe2731aaa8711408fe509344e7e6049def897389f7e2a86423f3377e'
            '17f251d456713c920c6581659c54b9c372e1a329081b2ed9d9826e9e0ddd317a')

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
    msg2 'Build Qt libraries'        && make -j$(nproc)

    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/${_pkgfqn}"
    make install -j$(nproc) -C ../build-${_arch} INSTALL_ROOT="${pkgdir}"

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
