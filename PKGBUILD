# Maintainer:
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>

# options
: ${_build_tg_owt:=true}

: ${_pkgtype:=git}

# basic info
_pkgname="telegram-desktop"
pkgname="$_pkgname${_pkgtype:+-$_pkgtype}"
pkgver=4.12.2.r10.g3adbfb1fb
pkgrel=1
pkgdesc='Official Telegram Desktop client'
url="https://github.com/telegramdesktop/tdesktop"
license=('GPL3')
arch=('x86_64')

# main package
_main_package() {
  depends+=(
    abseil-cpp
    ffmpeg
    glibmm-2.68
    hunspell
    libdispatch
    libsigc++-3.0
    libvpx
    minizip
    openal
    openh264
    opus
    protobuf
    qt6-base
    qt6-declarative
    qt6-svg
    qt6-wayland
    rnnoise
    xcb-util-keysyms
    xxhash

    ## implicit
    #gcc-libs
    #glib2
    #glibc
    #hicolor-icon-theme
    #libjpeg-turbo
    #libpipewire
    #libx11
    #libxcb
    #libxcomposite
    #libxdamage
    #libxext
    #libxfixes
    #libxrandr
    #libxtst
    #lz4
    #openssl
    #wayland
    #zlib
  )
  makedepends+=(
    'boost'
    'cmake'
    'extra-cmake-modules'
    'fmt'
    'git'
    'gobject-introspection'
    'ninja'
  )
  optdepends+=(
    'webkit2gtk: embedded browser features'
    'xdg-desktop-portal: desktop integration'
  )

  provides=("$_pkgname=${pkgver%%.r*}")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  _source_telegram_desktop
  _source_ericniebler_range_v3
  _source_telegramdesktop_libtgvoip

  _source_desktop_app_cmake_helpers
  _source_mnauw_cppgir

  if [[ x"${_build_tg_owt::1}" == "xt" ]] ; then
    _source_tg_owt
  else
    makedepends+=(
      'libtg_owt-git'
    )
  fi

}

# submodules
_source_telegram_desktop() {
  source+=(
    'apple.swift-corelibs-libdispatch'::'git+https://github.com/apple/swift-corelibs-libdispatch.git'
    'cyan4973.xxhash'::'git+https://github.com/Cyan4973/xxHash.git'
    'desktop-app.cmake_helpers'::'git+https://github.com/desktop-app/cmake_helpers.git'
    'desktop-app.codegen'::'git+https://github.com/desktop-app/codegen.git'
    'desktop-app.gsl'::'git+https://github.com/desktop-app/GSL.git'
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
    'ericniebler.range-v3'::'git+https://github.com/ericniebler/range-v3.git'
    'fcitx.fcitx5-qt'::'git+https://github.com/fcitx/fcitx5-qt.git'
    'gitlab-freedesktop-mirrors.wayland'::'git+https://github.com/gitlab-freedesktop-mirrors/wayland.git'
    'gitlab-freedesktop-mirrors.wayland-protocols'::'git+https://github.com/gitlab-freedesktop-mirrors/wayland-protocols.git'
    'google.cld3'::'git+https://github.com/google/cld3.git'
    'hamonikr.nimf'::'git+https://github.com/hamonikr/nimf.git'
    'hime-ime.hime'::'git+https://github.com/hime-ime/hime.git'
    'hunspell'::'git+https://github.com/hunspell/hunspell.git'
    'kde.kcoreaddons'::'git+https://github.com/KDE/kcoreaddons.git'
    'kde.kimageformats'::'git+https://github.com/KDE/kimageformats.git'
    'kde.plasma-wayland-protocols'::'git+https://github.com/KDE/plasma-wayland-protocols.git'
    'lz4'::'git+https://github.com/lz4/lz4.git'
    'nayuki.qr-code-generator'::'git+https://github.com/nayuki/QR-Code-generator.git'
    'tartanllama.expected'::'git+https://github.com/TartanLlama/expected.git'
    'telegramdesktop.libtgvoip'::'git+https://github.com/telegramdesktop/libtgvoip.git'
    'telegrammessenger.tgcalls'::'git+https://github.com/TelegramMessenger/tgcalls.git'
  )
  sha256sums+=(
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
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
  )

  _prepare_telegram_desktop() (
    cd "${srcdir:?}/$_pkgsrc"
    local -A _submodules=(
      ['apple.swift-corelibs-libdispatch']='Telegram/ThirdParty/dispatch'
      ['cyan4973.xxhash']='Telegram/ThirdParty/xxHash'
      ['desktop-app.cmake_helpers']='cmake'
      ['desktop-app.codegen']='Telegram/codegen'
      ['desktop-app.gsl']='Telegram/ThirdParty/GSL'
      ['desktop-app.lib_base']='Telegram/lib_base'
      ['desktop-app.lib_crl']='Telegram/lib_crl'
      ['desktop-app.lib_lottie']='Telegram/lib_lottie'
      ['desktop-app.lib_qr']='Telegram/lib_qr'
      ['desktop-app.lib_rpl']='Telegram/lib_rpl'
      ['desktop-app.lib_spellcheck']='Telegram/lib_spellcheck'
      ['desktop-app.lib_storage']='Telegram/lib_storage'
      ['desktop-app.lib_tl']='Telegram/lib_tl'
      ['desktop-app.lib_ui']='Telegram/lib_ui'
      ['desktop-app.lib_webrtc']='Telegram/lib_webrtc'
      ['desktop-app.lib_webview']='Telegram/lib_webview'
      ['desktop-app.libprisma']='Telegram/ThirdParty/libprisma'
      ['desktop-app.rlottie']='Telegram/ThirdParty/rlottie'
      ['ericniebler.range-v3']='Telegram/ThirdParty/range-v3'
      ['fcitx.fcitx5-qt']='Telegram/ThirdParty/fcitx5-qt'
      ['gitlab-freedesktop-mirrors.wayland']='Telegram/ThirdParty/wayland'
      ['gitlab-freedesktop-mirrors.wayland-protocols']='Telegram/ThirdParty/wayland-protocols'
      ['google.cld3']='Telegram/ThirdParty/cld3'
      ['hamonikr.nimf']='Telegram/ThirdParty/nimf'
      ['hime-ime.hime']='Telegram/ThirdParty/hime'
      ['hunspell']='Telegram/ThirdParty/hunspell'
      ['kde.kcoreaddons']='Telegram/ThirdParty/kcoreaddons'
      ['kde.kimageformats']='Telegram/ThirdParty/kimageformats'
      ['kde.plasma-wayland-protocols']='Telegram/ThirdParty/plasma-wayland-protocols'
      ['lz4']='Telegram/ThirdParty/lz4'
      ['nayuki.qr-code-generator']='Telegram/ThirdParty/QR'
      ['tartanllama.expected']='Telegram/ThirdParty/expected'
      ['telegramdesktop.libtgvoip']='Telegram/ThirdParty/libtgvoip'
      ['telegrammessenger.tgcalls']='Telegram/ThirdParty/tgcalls'
    )
    _submodule_update
  )
}

_source_ericniebler_range_v3() {
  source+=(
    'ericniebler.range-v3'::'git+https://github.com/ericniebler/range-v3.git'
  )
  sha256sums+=(
    'SKIP'
  )

  _prepare_ericniebler_range_v3() (
    cd "${srcdir:?}/$_pkgsrc"
    cd "Telegram/ThirdParty/range-v3"
    local -A _submodules=(
      ['ericniebler.range-v3']='doc/gh-pages'
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
    cd "${srcdir:?}/$_pkgsrc"
    cd "Telegram/ThirdParty/libtgvoip"
    local -A _submodules=(
      ['desktop-app.cmake_helpers']='cmake'
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
    cd "${srcdir:?}/$_pkgsrc"
    cd "cmake"
    local -A _submodules=(
      ['mnauw.cppgir']='external/glib/cppgir'
      ['yugr.implib.so']='external/Implib.so'
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
    cd "${srcdir:?}/$_pkgsrc"
    cd "cmake"
    cd "external/glib/cppgir"
    local -A _submodules=(
      ['martinmoene.expected-lite']='expected-lite'
    )
    _submodule_update
  )
}

# tg_owt
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
    "https://patch-diff.githubusercontent.com/raw/desktop-app/tg_owt/pull/101.patch"
    "tg_owt-fix.patch"
  )
  sha256sums+=(
    'SKIP'
    'f4d26c1048a7fd1ac3419042009c3b52c001458e44309a765d42d7df9f45f1ef'
    '8d3a1c4b2e40eef7a4cc8e6f498c416af47a91b878ec3762b51476e89695cb13'
  )

  # submodules - tg_owt
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

  _prepare_desktop_app_tg_owt() (
    cd "${srcdir:?}/$_pkgsrc_tgowt"
    local -A _submodules=(
      ['abseil.abseil-cpp']='src/third_party/abseil-cpp'
      ['chromiumsrc.libyuv']='src/third_party/libyuv'
      ['cisco.libsrtp']='src/third_party/libsrtp'
      ['google.crc32c']='src/third_party/crc32c/src'
    )
    _submodule_update

    apply-patch "${srcdir:?}/101.patch"
    apply-patch "${srcdir:?}/tg_owt-fix.patch"
  )
}

# common functions
prepare() {
  apply-patch() {
    printf '\nApplying patch %s\n' "$1"
    patch -Np1 -F100 -i "$1"
  }

  _submodule_update() {
    local key
    for key in ${!_submodules[@]} ; do
      git submodule init "${_submodules[${key}]}"
      git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
      git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
    done
  }

  if [[ x"${_build_tg_owt::1}" == "xt" ]] ; then
    _prepare_desktop_app_tg_owt
  fi

  _prepare_telegram_desktop
  _prepare_ericniebler_range_v3
  _prepare_telegramdesktop_libtgvoip

  _prepare_desktop_app_cmake_helpers
  _prepare_mnauw_cppgir
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' 2>/dev/null \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

_build_tg_owt() (
  local _cmake_options=(
    -B "build-tg_owt"
    -S "$_pkgsrc_tgowt"
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON
    -DBUILD_SHARED_LIBS=OFF
    -DTG_OWT_PACKAGED_BUILD=ON
  )

  cmake "${_cmake_options[@]}"
  cmake --build "build-tg_owt"
)

_build_telegram() (
  # Turns out we're allowed to use the official API key that telegram uses for their snap builds:
  # https://github.com/telegramdesktop/tdesktop/blob/8fab9167beb2407c1153930ed03a4badd0c2b59f/snap/snapcraft.yaml#L87-L88
  # Thanks @primeos!

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX="/usr"
    -DDESKTOP_APP_DISABLE_AUTOUPDATE=ON
    -DTDESKTOP_API_TEST=ON
    -DTDESKTOP_API_ID=611335
    -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c
    -DDESKTOP_APP_USE_PACKAGED_FONTS=OFF
    -Wno-dev
  )

  if [[ x"${_build_tg_owt::1}" == "xt" ]] ; then
    _cmake_options+=(-Dtg_owt_DIR="${srcdir:?}/build-tg_owt")
  fi

  cmake "${_cmake_options[@]}"
  cmake --build build
)

build() {
  if [[ x"${_build_tg_owt::1}" == "xt" ]] ; then
    _build_tg_owt
  fi

  _build_telegram
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build
}

# execute
_main_package
