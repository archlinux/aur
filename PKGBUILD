# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: jellysheep <max.mail@dameweb.de>

# BEFORE COMMENTING OR REPORING ISSUES, PLEASE READ THE FILE `README.md` IN THIS REPOSITORY.
# ALSO HAVE A LOOK AT THE COMMENTS IN THE AUR.

# DOES NOT WORK YET, see comment in build() function

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# This file is created from PKGBUILD.sh.ep contained by the mentioned repository.
# Do not edit it manually! See README.md in the repository's root directory
# for more information.

# All patches are managed at https://github.com/Martchus/qtbase

_qt_module=qtbase
pkgname=mingw-w64-qt5-base-dynamic
pkgver=5.15.1
pkgrel=1
pkgdesc='A cross-platform application and UI framework, dynamic OpenGL backend (mingw-w64)'
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
             'mingw-w64-vulkan-headers' 'mingw-w64-pkg-config' 'mingw-w64-environment')
# makedepends+=('mingw-w64-wine') # the dynamic/ANGLE version needs to run fxc.exe (not implemented yet)
groups=('mingw-w64-qt5')
provides+=('mingw-w64-qt5-base')
conflicts+=('mingw-w64-qt5-base' 'mingw-w64-qt5-base-angle' 'mingw-w64-qt5-base-noopengl'
            'mingw-w64-qt5-base-dynamic' 'mingw-w64-qt5-base-openql')
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
            'fec4ca039859f9cc9685b34a7bd2da9e0fe24b5b1f85d7cd12665631fa797b44'
            'a0ea35e6eef4fed06360efa05e11b898f6033d893e1f1657a240cc03e43f076e'
            'cda13b2856fafe92b1369d6f2d01bd4d9bbdb0ec96c25e91e48ba25267c74c6c'
            'e13cd18ad781512862b5d288a53ebd09dc0e8bcc6fd3c4e833d0c593f28edd3a'
            '273af9db2954c1d62e29d2a8328bbfa918bae617456aff6645df4bfb72796e0d'
            '84a801d904fe308a56a9112af9aa73656eacf36ed7684449363281bfe4108543'
            '190795aa778ae4e7bd8a74ce56504c697435129b73d2f0418511a4a230f68bc5'
            '3fff6151dcf76bed12864dba51e4d04d39f8b3969c502a71ed547b527b310d7a'
            '56240f509157a04ba1f1a23b0e058c2212d66e34aca68a688c15f5d8804bf174'
            '02ca3a112f3e35749c141ed9c7e87a1fd0e82aa852541024b85f40a99d24d9fc'
            '3b4dcce669d359953603257e621e6ebc30fb88f0f1c48b35ec443c574f2b05e8'
            'ba302124391aea5438e82195dd276edd8942f04cff7c6b85a9f0a5279749566b'
            '68b5f9e0535c8d030161e67a0e8ee8bec2a80a9c8f69c09a4ad25fe98eb9dfd2'
            'ab46b53eb6272185a05d11820317db421be6e4440166967911e7d59d4f0a03d4'
            'c11a14a02e48e39e8212097915aed2347825a33022d367f322e34f3aaaf33f90'
            '6d7c8fd7a162174355dd12399bd8f47f470557751dc117271c02e2e7b385d424'
            '3c28f5658e0f960091c1991586167ee06bcecd8d843123fbf37ab78a1f5f30f0'
            'f9545474bd73be049dbf84fc2ff455e924e6fb29bb807809c384bf56a0227ad6'
            '2998069e3a427c940f496d75df4cea05acb10d3e82c333a5c957e37f0543a0e8'
            'a301ddcd46b9b2fb58d592af88ac6acf81b2dbd328fb8c4c3ef49abffe343267'
            '3d1257390ff151365d7fa29cde5f9c118310fe727243fb6f50ad30ab117c3384'
            '19534087d5fc4b434859d68476ebd0647fdc04bf78f24943b7ab88cccf09b08a'
            '5a57c66303d4a898dd5cccd9c639f367b50b508256fdf9c00ba5179bb00d701c'
            '84b9e41b7320834a73edf1d192e511801feb51cd2de60ecc28e46982cd572df4'
            '85bba2428090518dca878ca117299b065913f125c00cede57b31d37a02d0b787'
            'f0429a442805c2e0181e8b3b7814259586fdcba000bf324c0e367858c351f6b1'
            'c8479468cfb4a70fe65a1317f3fbacd40dcdc7a8bafc88648160509ee8b216e8'
            'a2eb9e683b12efe7fbb365749bdd5373e0fbf6438fe5342effab93f3a262d808'
            '4c097460c443ec0ca47a41ea1ad6fdaa08e394b7a883d54da69bf9557ccbea31'
            'e1f2b8bfe9f3cdacceb6d9b73573ad39ea73ac0fce74448c7df0262b34b703bb'
            '553c15e8cf230c3d3f3fa4c4a7a5a46d18027a4d6c7493f3eab56ca97bd906d9')

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
    # FIXME: This is broken because is requires enabling the (bundled) ANGLE which is
    #        broken because we needed to invoke fxc.exe (Direct3D Shader Compiler)
    #        during the build. Maybe start it with WINE?
    msg2 'Using dynamic OpenGL backend'
    qt_configure_args+=' -opengl dynamic'
    qt_configure_args+=' -angle'
    # enable declarations of GLES functions
    # FIXME: Still required?
    qt_configure_args+=' -DGL_GLEXT_PROTOTYPES'

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
