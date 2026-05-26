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
pkgver=5.15.19+kde+r96
pkgrel=1
_basever=${pkgver%%+*}
_commit=fbed962c3195ab3952fa54d40e012ad1a4fdc42b
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
sha256sums=('fa3b11138b081a1b1f2412fcfa1177962460d05b71240ba01b7ea181eff6acc3'
            '462d46aa6b3ff32b9fd91325ccedee61b9345b1543e0ff1ff51113c3f1c21a66'
            'e38f4b05cec20e721f34d8b7838ecc9adbe13724511bfad9ea7bebda3275f3d6'
            'aed4523be668add403171234b18aaed6f6e6bae9726f55ccff935a8fb5dc65f0'
            '37e50f55a91488aecb396d44c0005146d17bfe00fe422d1130e80ebadaeac695'
            '2c4cf2d0c6e3183059436515766599471d5ef6bf60b2c71c12cf50b9360e7557'
            '7e185921b9a5e142730980e5e13db682a94c8986ffd9cee4793e6307408c631a'
            '8cc63dd68b245e98b1025a87211093779f21b7be2ff86d6e079a00c2250089dd'
            '6ae578c35840266c8f65fd3e8a9498389ccd95f75d101a0efe35def0128b9598'
            'cab57413e138c2021c29d4b962179d133145940bd954d9dcbfb7c76453c935eb'
            '9330a7156ed9f1f7e7bb00b63e2f4d8f7f0b2ca08817dac1fb44a2803c0f9cec'
            'e42ea2d5e3029fa845ac22af65586ad762184ece4c78ad04d88bb8d2026a476f'
            'd5fc0d85f7f22320f1b02106b39ff6d7145291cea1cc617e07a9ced279bbd155'
            '30a98898b13ce31e576b286bfef4b816395b6a4be449b9bf9625c1709ec8d4b4'
            '19ff77bbec9f214837604090988cb455697789fa600b8951f50f3ab13e6768f6'
            '32330d3c0103699dc215ab8d94c4f9515f69f6391e8bdcbf444b0c58160eaee1'
            '990ac2ae582c38a0651c096cda77129ceabea5b792a4e2b0cabc0775558b2945'
            '6ed1aa52521d21ec5c643ce3a25ac3db2d0c40794ad713951c6835e2730139a0'
            '7d7c18f4c0525d935613705f0cb612aa4cc73d3ea1dbe618d83ff0fd5a31101c'
            '6cccac5d61ba4588f953c8687738fa62100629714b9ef2070c536999e81dab0e'
            'a51f1f3e580d9ad6044a0a144ce5338e6a4a1c298c9f1eb07bb5fa03e334ec3e'
            'd00ac64fd08f013297bc982aa61503f1ac2d3f03550d62e88b270605821bb8f9'
            '15d95de8186712b4e34638c33246cf4f1b613a48d74c057889293f0b79f271ec'
            'e2c46d9507fe13b19f7f1a843a041a623a04a457ef42f8b5020d3f3c938dc212'
            'a289a6c5185c382010fd6ebe8a2d1ebda7f14e5af14558aab7f45cd8c9ea7c93'
            'db3cf08f4490dc401dce78eab2dc32f92032f856bdd37f362cf43b8bdf5c9f1e'
            '19ce5724137a858a0587f8a24c435754d9df953d1d860aab0cb7ed262903b928'
            'd7b604a0a5b03fee8099ca8dd36b60cd787afb9b7d6fa4fc66df043529e64894'
            'bfcd82abca4e6822f75656781870d118b2cbf9e2f8921c6c85b1750a58fdb127'
            'e4c45e7a960fb70ef00ca9c6599611e13be83c9d04fa9c1a872f33193edddc38'
            '92262956bb4e00751fe778bff32ac230cdfe3b13152de35d1a43ca671f22f84a'
            '7a63982fae59ed7148779553c8ac3dbdf925e56ec45cbf66456d14e2abe649bb'
            '374fd859f954360775dd8121cf17690ff0b4cf4bc5e30fbe09a34b7473d048df')

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
