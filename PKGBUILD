# Maintainer: Martchus <martchus@gmx.net>
# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# All patches are managed at https://github.com/Martchus/qtbase

pkgname=apple-darwin-qt5-base
pkgver=5.9.1
pkgrel=1
pkgdesc='A cross-platform application and UI framework (apple-darwin)'
arch=('i686' 'x86_64')
url='https://www.qt.io/'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
depends=('apple-darwin-osxcross')
groups=('apple-darwin-qt5')
optdepends=()
makedepends=('clang')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
_pkgfqn="qtbase-opensource-src-${pkgver}"
source=("https://download.qt.io/official_releases/qt/${pkgver:0:3}/${pkgver}/submodules/${_pkgfqn}.tar.xz"
        '0001-Enable-cross-compilation-with-osxcross.patch'
        '0002-Allow-overriding-stdlib-under-MacOS.patch'
        '0003-Remove-error-handling-for-Xcode-detection.patch'
        '0004-Fix-build-errors-under-32-bit-MacOS.patch'
        '0005-Prevent-debug-library-names-in-pkg-config-files.patch'
        '0006-Pull-dependencies-of-static-libraries-in-CMake-modul.patch'
        '0007-Fix-finding-gl.h-when-cross-compiling-with-osxcross.patch'
        '0008-Prevent-error-when-qmlimportscanner-not-available.patch')
sha256sums=('bc9a21e9f6fff9629019fdf9f989f064751d5073c3a28dc596def92f4d4275c6'
            'f5b474fc11f929c8e1563136c6b53d09c9e405ebf5a7940a63dc13f00d3e2bbd'
            'a51749efb16b81f5e272a0864a6e2583942998bca1fe397c0e4205b269c97ae4'
            '73d314dad7a93073140ee9d868e1071a107b1afdecc67cb67d85a91391452a82'
            '96db51e0cac5ee455931f404fd72ff13b1bab6174034f0dd9460d43d94e970f0'
            'b665c7ee5b4bf603dd7a224d5d72d2fb669d9c7ec40b47cebe3ab3392c523b36'
            '571acd36daf587c44af728e0d63531ceb44e987b572c37bf98a379af13a77b84'
            'f0e75b20c059af982091093a3e7f13e9099e6568210bf753c3cc84fa9181a4f1'
            '56b75af151978d8a25c658a6accded13d3ddc16b21a3524abb08e40a52cbe113')
_osxcrossprefix='/opt/osxcross'

# Disable 32-bit build ...
#_architectures='x86_64-apple-darwin15 i386-apple-darwin15'
_architectures='x86_64-apple-darwin15'

# ... because it fails to compile "src/plugins/platforms/cocoa/qcocoahelpers.mm":
# /opt/osxcross/bin/i386-apple-darwin15-clang++ -c -pipe -D__STRICT_ANSI__ -foc-use-gcc-libstdc++ -g -Og -fPIC -std=c++1y  -arch i386 -isysroot /opt/osxcross/bin/../SDK/MacOSX10.11.sdk -mmacosx-version-min=10.5 -fvisibility=hidden -fvisibility-inlines-hidden -fno-exceptions -Wall -W -fPIC -DNS_BUILD_32_LIKE_64 -DQT_NO_NARROWING_CONVERSIONS_IN_CONNECT -DQT_NO_EXCEPTIONS -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -DQT_STATICPLUGIN -DQT_PLUGIN -DQT_ACCESSIBILITY_SUPPORT_LIB -DQT_THEME_SUPPORT_LIB -DQT_FONTDATABASE_SUPPORT_LIB -DQT_GRAPHICS_SUPPORT_LIB -DQT_CLIPBOARD_SUPPORT_LIB -DQT_CGL_SUPPORT_LIB -DQT_PRINTSUPPORT_LIB -DQT_WIDGETS_LIB -DQT_GUI_LIB -DQT_CORE_LIB -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/src/plugins/platforms/cocoa -I. -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/include -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/include/QtAccessibilitySupport -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/include/QtAccessibilitySupport/5.9.1 -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/include/QtAccessibilitySupport/5.9.1/QtAccessibilitySupport -I../../../../include -I../../../../include/QtAccessibilitySupport -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/include/QtThemeSupport -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/include/QtThemeSupport/5.9.1 -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/include/QtThemeSupport/5.9.1/QtThemeSupport -I../../../../include/QtThemeSupport -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/include/QtFontDatabaseSupport -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/include/QtFontDatabaseSupport/5.9.1 -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/include/QtFontDatabaseSupport/5.9.1/QtFontDatabaseSupport -I../../../../include/QtFontDatabaseSupport -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/include/QtGraphicsSupport -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/include/QtGraphicsSupport/5.9.1 -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/include/QtGraphicsSupport/5.9.1/QtGraphicsSupport -I../../../../include/QtGraphicsSupport -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/include/QtPrintSupport/5.9.1 -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/include/QtPrintSupport/5.9.1/QtPrintSupport -I../../../../include/QtPrintSupport/5.9.1 -I../../../../include/QtPrintSupport/5.9.1/QtPrintSupport -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/include/QtWidgets/5.9.1 -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/include/QtWidgets/5.9.1/QtWidgets -I../../../../include/QtWidgets/5.9.1 -I../../../../include/QtWidgets/5.9.1/QtWidgets -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/include/QtGui/5.9.1 -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/include/QtGui/5.9.1/QtGui -I../../../../include/QtGui/5.9.1 -I../../../../include/QtGui/5.9.1/QtGui -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/include/QtClipboardSupport -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/include/QtClipboardSupport/5.9.1 -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/include/QtClipboardSupport/5.9.1/QtClipboardSupport -I../../../../include/QtClipboardSupport -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/include/QtCglSupport -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/include/QtCglSupport/5.9.1 -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/include/QtCglSupport/5.9.1/QtCglSupport -I../../../../include/QtCglSupport -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/include/QtPrintSupport -I../../../../include/QtPrintSupport -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/include/QtWidgets -I../../../../include/QtWidgets -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/include/QtGui -I../../../../include/QtGui -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/include/QtCore/5.9.1 -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/include/QtCore/5.9.1/QtCore -I../../../../include/QtCore/5.9.1 -I../../../../include/QtCore/5.9.1/QtCore -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/include/QtCore -I../../../../include/QtCore -I.moc/debug -I/opt/osxcross/SDK/MacOSX10.11.sdk/System/Library/Frameworks/OpenGL.framework/Headers -I/opt/osxcross/SDK/MacOSX10.11.sdk/System/Library/Frameworks/AGL.framework/Headers -I/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/mkspecs/macx-clang -o .obj/debug/qcocoahelpers.o /build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/src/plugins/platforms/cocoa/qcocoahelpers.mm
# /build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/src/plugins/platforms/cocoa/qcocoahelpers.mm:312:9: error: use of undeclared identifier
#      '_okButton'
#        _okButton.target = panelDelegate;
#        ^
#/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/src/plugins/platforms/cocoa/qcocoahelpers.mm:314:9: error: use of undeclared identifier
#      '_cancelButton'
#        _cancelButton = [self createButtonWithTitle:"Cancel"];
#        ^
#/build/apple-darwin-qt5-base/src/qtbase-opensource-src-5.9.1/src/plugins/platforms/cocoa/qcocoahelpers.mm:315:9: error: use of undeclared identifier
#      '_cancelButton'; did you mean 'NSCancelButton'?
#        _cancelButton.action = @selector(onCancelClicked);
#        ^~~~~~~~~~~~~
#        NSCancelButton

patch() {
  local input_found=
  local patch_file=
  for arg in $@; do
    if [[ $input_found ]]; then
      patch_file="$arg"
      break
    fi
    [[ $arg == -i ]] && input_found=1
  done
  msg2 "Applying patch $patch_file"
  /usr/bin/patch $@
}

prepare() {
  cd "${srcdir}/${_pkgfqn}"

  # Apply patches; further descriptions can be found in patch files itself
  for patch in "$srcdir/"*.patch; do
    patch -p1 -i "$patch"
  done

  # Some Xcode tools for SDK detection are not available under osxcross (at least I don't know where to get them)
  # Hence the SDK info must be provided manually
  msg2 "Setting SDK info"
  sed -i '1s;^;QMAKE_MAC_SDK.macosx.Path = '"$(${_osxcrossprefix}/bin/xcrun --sdk macosx --show-sdk-path)"'\
QMAKE_MAC_SDK.macosx.SDKVersion = '"$(${_osxcrossprefix}/bin/xcrun --sdk macosx --show-sdk-version)"'\
QMAKE_MAC_SDK.macosx.PlatformPath = '"${_osxcrossprefix}"'\n;' 'mkspecs/features/mac/sdk.prf'
}

init_osxcross() {
  # add osxcross toolchain to path
  export PATH="${_osxcrossprefix}/bin:$PATH"
  # enable use of ccache (if installed)
  [[ -f /usr/bin/ccache ]] && \
    export PATH="${_osxcrossprefix}/lib/ccache/bin:$PATH"
}

build() {
  cd "${srcdir}/${_pkgfqn}"

  # Do not set any flags here, flags are configured via mkspec
  # Setting flags here is not appropriate as it does not allow to
  # distinguish between flags for native compiler and cross compiler
  unset CFLAGS
  unset CXXFLAGS
  unset LDFLAGS
  unset PKG_CONFIG_PATH

  init_osxcross

  for _arch in ${_architectures}; do
    # To prevent conflicts with the mingw-w64-qt4 package we have
    # to put tools in a dedicated folder

    # The last device option allows using ccache though the use of
    # pre-compile header
    # (sloppiness must be set to pch_defines,time_macros in ccache config)

    # For simplicity, this package only includes a static build so far
    # (no 2 variants like mingw-w64-qt5-base/mingw-w64-qt5-base-static available)

    # It uses the native MacOS API ("-securetransport") rather than OpenSSL

    # MySQL and PostgreSQL are disabled, because needed packages are not available
    # yet, for the same reason bundled freetype2 and harfbuzz are used

    local qt_configure_args="\
      -static \
      -xplatform macx-clang \
      -securetransport \
      -optimized-qmake \
      -verbose \
      -opensource \
      -confirm-license \
      -force-debug-info \
      -sql-sqlite \
      -no-glib \
      -no-icu \
      -nomake examples \
      -make tools \
      -hostprefix ${_osxcrossprefix}/${_arch} \
      -hostdatadir ${_osxcrossprefix}/${_arch}/lib/qt \
      -hostbindir ${_osxcrossprefix}/${_arch}/lib/qt/bin \
      -prefix ${_osxcrossprefix}/${_arch} \
      -bindir ${_osxcrossprefix}/${_arch}/bin \
      -archdatadir ${_osxcrossprefix}/${_arch}/lib/qt \
      -datadir ${_osxcrossprefix}/${_arch}/share/qt \
      -docdir ${_osxcrossprefix}/${_arch}/share/doc/qt \
      -examplesdir ${_osxcrossprefix}/${_arch}/share/qt/examples \
      -headerdir ${_osxcrossprefix}/${_arch}/include/qt \
      -libdir ${_osxcrossprefix}/${_arch}/lib \
      -plugindir ${_osxcrossprefix}/${_arch}/lib/qt/plugins \
      -sysconfdir ${_osxcrossprefix}/${_arch}/etc \
      -translationdir ${_osxcrossprefix}/${_arch}/share/qt/translations \
      QMAKE_APPLE_DEVICE_ARCHS=${_arch%%-*} \
      QMAKE_MACOSX_DEPLOYMENT_TARGET=10.5 \
      -device-option CROSS_COMPILE=${_arch}- \
      -device-option QMAKE_MACOSX_STDLIB=libstdc++ \
      -device-option CROSS_COMPILE_CFLAGS=-fpch-preprocess"

    # Disable debug build (unless APPLE_DARWIN_QT_DEBUG_BUILD is defined)
    [[ $APPLE_DARWIN_QT_DEBUG_BUILD ]] \
      && qt_configure_args+=' -debug_and_release' \
      || qt_configure_args+=' -release'

    mkdir -p ../build-${_arch} && pushd ../build-${_arch}
    ../${_pkgfqn}/configure $qt_configure_args
    make
    popd
  done
}

package() {
  init_osxcross

  for _arch in ${_architectures}; do
    cd "$srcdir/${_pkgfqn}"
    make install -C ../build-${_arch} INSTALL_ROOT="${pkgdir}"

    # Create symlinks for tools
    mkdir -p "${pkgdir}/${_osxcrossprefix}/bin"
    for tool in qmake moc rcc uic qdbuscpp2xml qdbusxml2cpp qdoc syncqt.pl; do
      ln -s "../${_arch}/lib/qt/bin/${tool}" "${pkgdir}/${_osxcrossprefix}/bin/${_arch}-${tool}-qt5"
    done

    # Remove doc
    rm -rf "${pkgdir}/${_osxcrossprefix}/${_arch}/share"

    # Strip the binaries, remove debug libraries
    strip --strip-all "${pkgdir}/${_osxcrossprefix}/${_arch}/lib/qt/bin/"*[!.pl]
    strip -g "${pkgdir}/${_osxcrossprefix}/${_arch}/lib/libQt5Bootstrap.a"
    # TODO: Still not sure which kind of binaries (shared/static lib, application) should be stripped how
    find "${pkgdir}/${_osxcrossprefix}" -name "*.dylib" -a -not -iname '*_debug*' -exec ${_osxcrossprefix}/bin/${_arch}-strip -S -x {} \;
    find "${pkgdir}/${_osxcrossprefix}" -name '*.a' -a -not -iname '*_debug.a' -a -not -iname '*DevTools.a' -a -not -iname '*Bootstrap.a' -exec ${_osxcrossprefix}/bin/${_arch}-strip -S -x {} \;
    [[ $APPLE_DARWIN_QT_DEBUG_BUILD ]] || find "${pkgdir}/${_osxcrossprefix}" -iname '*_debug*' -exec rm {} \;
  done

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/${_osxcrossprefix}" -type f -name '*.prl' -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;
}
