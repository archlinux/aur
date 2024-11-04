# Maintainer:
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>

_pkgname="telegram-desktop"
pkgname="$_pkgname-git"
pkgver=5.7.1.r0.g233eb6d
pkgrel=1
pkgdesc='Official Telegram Desktop client'
url="https://github.com/telegramdesktop/tdesktop"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends+=(
  ada
  ffmpeg
  glibmm-2.68
  hunspell
  jemalloc
  kcoreaddons
  libdispatch
  libsigc++-3.0
  libvpx
  libxdamage
  minizip
  openal
  openh264
  opus
  protobuf
  qt6-base
  qt6-declarative
  qt6-svg
  qt6-wayland
  range-v3
  rnnoise
  tl-expected
  xcb-util-keysyms
  xxhash
)
makedepends+=(
  boost
  cmake
  extra-cmake-modules
  fmt
  git
  glib2-devel
  gobject-introspection
  ninja
)
optdepends+=(
  'webkit2gtk: embedded browser features'
  'xdg-desktop-portal: desktop integration'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_source_main() {
  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')
}

_source_telegram_desktop() {
  source+=(
    #'apple.swift-corelibs-libdispatch'::'git+https://github.com/apple/swift-corelibs-libdispatch.git'
    'cyan4973.xxhash'::'git+https://github.com/Cyan4973/xxHash.git'
    'desktop-app.cmake_helpers'::'git+https://github.com/desktop-app/cmake_helpers.git'
    'desktop-app.codegen'::'git+https://github.com/desktop-app/codegen.git'
    'desktop-app.lib_base'::'git+https://github.com/desktop-app/lib_base.git'
    'desktop-app.lib_crl'::'git+https://github.com/desktop-app/lib_crl.git'
    'desktop-app.lib_lottie'::'git+https://github.com/desktop-app/lib_lottie.git'
    'desktop-app.lib_qr'::'git+https://github.com/desktop-app/lib_qr.git'
    'desktop-app.lib_rpl'::'git+https://github.com/desktop-app/lib_rpl.git'
    'desktop-app.lib_spellcheck'::'git+https://github.com/desktop-app/lib_spellcheck.git'
    'desktop-app.lib_storage'::'git+https://github.com/desktop-app/lib_storage.git'
    'desktop-app.lib_tl'::'git+https://github.com/desktop-app/lib_tl.git'
    'desktop-app.lib_ui'::'git+https://github.com/desktop-app/lib_ui.git'
    'desktop-app.lib_webrtc'::'git+https://github.com/desktop-app/lib_webrtc.git'
    'desktop-app.lib_webview'::'git+https://github.com/desktop-app/lib_webview.git'
    'desktop-app.libprisma'::'git+https://github.com/desktop-app/libprisma.git'
    'desktop-app.rlottie'::'git+https://github.com/desktop-app/rlottie.git'
    #'ericniebler.range-v3'::'git+https://github.com/ericniebler/range-v3.git'
    'fcitx.fcitx5-qt'::'git+https://github.com/fcitx/fcitx5-qt.git'
    'flatpak.xdg-desktop-portal'::'git+https://github.com/flatpak/xdg-desktop-portal.git'
    'google.cld3'::'git+https://github.com/google/cld3.git'
    'hamonikr.nimf'::'git+https://github.com/hamonikr/nimf.git'
    'hime-ime.hime'::'git+https://github.com/hime-ime/hime.git'
    #'hunspell'::'git+https://github.com/hunspell/hunspell.git'
    #'jemalloc'::'git+https://github.com/jemalloc/jemalloc.git'
    #'kde.kcoreaddons'::'git+https://github.com/KDE/kcoreaddons.git'
    #'kde.kimageformats'::'git+https://github.com/KDE/kimageformats.git'
    'lz4'::'git+https://github.com/lz4/lz4.git'
    'microsoft.gsl'::'git+https://github.com/Microsoft/GSL.git'
    'nayuki.qr-code-generator'::'git+https://github.com/nayuki/QR-Code-generator.git'
    'tartanllama.expected'::'git+https://github.com/TartanLlama/expected.git'
    'telegramdesktop.libtgvoip'::'git+https://github.com/telegramdesktop/libtgvoip.git'
    'telegrammessenger.tgcalls'::'git+https://github.com/TelegramMessenger/tgcalls.git'
  )
  sha256sums+=(
    #'SKIP'
    #'SKIP'
    #'SKIP'
    #'SKIP'
    #'SKIP'
    #'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
  )

  _prepare_telegram_desktop() (
    cd "$srcdir/$_pkgsrc"
    local _submodules=(
      #'apple.swift-corelibs-libdispatch'::'Telegram/ThirdParty/dispatch'
      'cyan4973.xxhash'::'Telegram/ThirdParty/xxHash'
      'desktop-app.cmake_helpers'::'cmake'
      'desktop-app.codegen'::'Telegram/codegen'
      'desktop-app.lib_base'::'Telegram/lib_base'
      'desktop-app.lib_crl'::'Telegram/lib_crl'
      'desktop-app.lib_lottie'::'Telegram/lib_lottie'
      'desktop-app.lib_qr'::'Telegram/lib_qr'
      'desktop-app.lib_rpl'::'Telegram/lib_rpl'
      'desktop-app.lib_spellcheck'::'Telegram/lib_spellcheck'
      'desktop-app.lib_storage'::'Telegram/lib_storage'
      'desktop-app.lib_tl'::'Telegram/lib_tl'
      'desktop-app.lib_ui'::'Telegram/lib_ui'
      'desktop-app.lib_webrtc'::'Telegram/lib_webrtc'
      'desktop-app.lib_webview'::'Telegram/lib_webview'
      'desktop-app.libprisma'::'Telegram/ThirdParty/libprisma'
      'desktop-app.rlottie'::'Telegram/ThirdParty/rlottie'
      #'ericniebler.range-v3'::'Telegram/ThirdParty/range-v3'
      'fcitx.fcitx5-qt'::'Telegram/ThirdParty/fcitx5-qt'
      'flatpak.xdg-desktop-portal'::'Telegram/ThirdParty/xdg-desktop-portal'
      'google.cld3'::'Telegram/ThirdParty/cld3'
      'hamonikr.nimf'::'Telegram/ThirdParty/nimf'
      'hime-ime.hime'::'Telegram/ThirdParty/hime'
      #'hunspell'::'Telegram/ThirdParty/hunspell'
      #'jemalloc'::'Telegram/ThirdParty/jemalloc'
      #'kde.kcoreaddons'::'Telegram/ThirdParty/kcoreaddons'
      #'kde.kimageformats'::'Telegram/ThirdParty/kimageformats'
      'lz4'::'Telegram/ThirdParty/lz4'
      'microsoft.gsl'::'Telegram/ThirdParty/GSL'
      'nayuki.qr-code-generator'::'Telegram/ThirdParty/QR'
      'tartanllama.expected'::'Telegram/ThirdParty/expected'
      'telegramdesktop.libtgvoip'::'Telegram/ThirdParty/libtgvoip'
      'telegrammessenger.tgcalls'::'Telegram/ThirdParty/tgcalls'
    )
    _submodule_update
  )
}

_source_telegramdesktop_libtgvoip() {
  source+=(
    'desktop-app.cmake_helpers'::'git+https://github.com/desktop-app/cmake_helpers.git'
  )
  sha256sums+=(
    'SKIP'
  )

  _prepare_telegramdesktop_libtgvoip() (
    cd "$srcdir/$_pkgsrc"
    cd "Telegram/ThirdParty/libtgvoip"
    local _submodules=(
      'desktop-app.cmake_helpers'::'cmake'
    )
    _submodule_update
  )
}

_source_desktop_app_cmake_helpers() {
  source+=(
    'mnauw.cppgir'::'git+https://gitlab.com/mnauw/cppgir.git'
    'yugr.implib.so'::'git+https://github.com/yugr/Implib.so.git'
  )
  sha256sums+=(
    'SKIP'
    'SKIP'
  )

  _prepare_desktop_app_cmake_helpers() (
    cd "$srcdir/$_pkgsrc"
    cd "cmake"
    local _submodules=(
      'mnauw.cppgir'::'external/glib/cppgir'
      'yugr.implib.so'::'external/Implib.so'
    )
    _submodule_update
  )
}

_source_mnauw_cppgir() {
  source+=(
    'martinmoene.expected-lite'::'git+https://github.com/martinmoene/expected-lite.git'
  )
  sha256sums+=(
    'SKIP'
  )

  _prepare_mnauw_cppgir() (
    cd "$srcdir/$_pkgsrc"
    cd "cmake"
    cd "external/glib/cppgir"
    local _submodules=(
      'martinmoene.expected-lite'::'expected-lite'
    )
    _submodule_update
  )
}

_source_tg_owt() {
  makedepends+=(
    pipewire
    yasm

    libxcomposite
    libxrandr
    libxtst
  )

  _pkgsrc_tgowt="telegram-tg_owt"
  source+=(
    "$_pkgsrc_tgowt"::"git+https://github.com/desktop-app/tg_owt.git"
  )
  sha256sums+=(
    'SKIP'
  )

  source+=(
    'abseil.abseil-cpp'::'git+https://github.com/abseil/abseil-cpp.git'
    'chromiumsrc.libyuv'::'git+https://gitlab.com/chromiumsrc/libyuv.git'
    'cisco.libsrtp'::'git+https://github.com/cisco/libsrtp.git'
    'google.crc32c'::'git+https://github.com/google/crc32c.git'
  )
  sha256sums+=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
  )

  _prepare_tg_owt() (
    cd "$srcdir/$_pkgsrc_tgowt"
    local _submodules=(
      'abseil.abseil-cpp'::'src/third_party/abseil-cpp'
      'chromiumsrc.libyuv'::'src/third_party/libyuv'
      'cisco.libsrtp'::'src/third_party/libsrtp'
      'google.crc32c'::'src/third_party/crc32c/src'
    )
    _submodule_update
  )
}

_source_main
_source_telegram_desktop
_source_telegramdesktop_libtgvoip

_source_desktop_app_cmake_helpers
_source_mnauw_cppgir

_source_tg_owt

prepare() {
  _submodule_update() {
    local _module
    for _module in "${_submodules[@]}"; do
      git submodule init "${_module##*::}"
      git submodule set-url "${_module##*::}" "$srcdir/${_module%::*}"
      git -c protocol.file.allow=always submodule update "${_module##*::}"
    done
  }

  _prepare_tg_owt

  _prepare_telegram_desktop
  _prepare_telegramdesktop_libtgvoip

  _prepare_desktop_app_cmake_helpers
  _prepare_mnauw_cppgir
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]+//;s/([^-]*-g)/r\1/;s/-/./g'
}

_build_tg_owt() (
  local _cmake_crc32=(
    -B "build_crc32"
    -S "$srcdir/google.crc32c"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCRC32C_BUILD_TESTS=OFF
    -DCRC32C_BUILD_BENCHMARKS=OFF
    -DCRC32C_USE_GLOG=OFF
    -Wno-dev
  )

  cmake "${_cmake_crc32[@]}"
  cmake --build "build_crc32"
  DESTDIR="$srcdir/deps_crc32" cmake --install "build_crc32"

  local _cmake_tg_owt=(
    -B "build_tg_owt"
    -S "$_pkgsrc_tgowt"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON
    -DBUILD_SHARED_LIBS=OFF
    -DTG_OWT_PACKAGED_BUILD=ON
    -DCMAKE_PREFIX_PATH="$srcdir/deps_crc32/usr"
    -Wno-dev
  )

  cmake "${_cmake_tg_owt[@]}"
  cmake --build "build_tg_owt"
)

_build_telegram() (
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DDESKTOP_APP_DISABLE_AUTOUPDATE=ON
    -DTDESKTOP_API_TEST=ON
    -DTDESKTOP_API_ID=611335
    -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c
    -DDESKTOP_APP_USE_PACKAGED_FONTS=OFF
    -Dtg_owt_DIR="$srcdir/build_tg_owt"
    -DCMAKE_PREFIX_PATH="$srcdir/deps_crc32/usr"
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
)

build() {
  export LDFLAGS+=" -Wl,--copy-dt-needed-entries"

  _build_tg_owt
  _build_telegram
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
