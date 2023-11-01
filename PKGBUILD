# Maintainer:
# Contributor: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: 3Jl0y_PYCCKUi <3jl0y_pycckui@riseup.net>
# Contributor: solopasha <daron439 at gmail dot com>
# Contributor: Ilya Fedin <fedin-ilja2010@ya.ru>
# Contributor: Auteiy <dmitry@auteiy.me>

_pkgname="kotatogram-desktop"
pkgname="$_pkgname-git"
pkgver=1.4.9.r2.g52b300cb3
pkgrel=1
pkgdesc='Experimental fork of Telegram Desktop'
url="https://github.com/kotatogram/kotatogram-desktop"
license=('GPL3')
arch=('x86_64')

depends=(
  # 'qt6-5compat'
  # 'qt6-imageformats'
  # 'qt6-svg'
  # 'qt6-wayland'
  'abseil-cpp'
  'ffmpeg4.4'
  'gcc-libs'
  'glib2'
  'glibc'
  'glibmm'
  'hicolor-icon-theme'
  'hunspell'
  'jemalloc'
  'kwayland5'
  'libdispatch'
  'libjpeg-turbo'
  'libsigc++'
  'libvpx'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxrandr'
  'libxtst'
  'lz4'
  'minizip'
  'openal'
  'openssl-1.1'
  'opus'
  'pipewire'
  'qt5-imageformats'
  'qt5-svg'
  'qt5-wayland'
  'rnnoise'
  'ttf-opensans'
  'wayland'
  'xcb-util-keysyms'
  'xxhash'
  'zlib'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'git'
  'meson'
  'microsoft-gsl'
  'ninja'
  'plasma-wayland-protocols'
  'python'
  'range-v3'
  'tl-expected'
  'unzip'
  'wayland-protocols'
  'webkit2gtk'
  'yasm'
)
optdepends=(
  'webkit2gtk: embedded browser features'
  'xdg-desktop-portal: desktop integration'
)

provides=('kotatogram-desktop')
conflicts=('kotatogram-desktop')

_tg_owt_commit=63a934db1ed212ebf8aaaa20f0010dd7b0d7b396

_pkgsrc="$_pkgname"
source=(
  # kotatogram-desktop and patches
  "$_pkgsrc"::"git+$url.git#branch=dev"

  "include.patch"
  "kf594.patch"
  "https://patch-diff.githubusercontent.com/raw/kotatogram/kotatogram-desktop/pull/326.patch"
  "https://patch-diff.githubusercontent.com/raw/kotatogram/kotatogram-desktop/pull/333.patch"
  "https://patch-diff.githubusercontent.com/raw/kotatogram/kotatogram-desktop/pull/334.patch"
  "https://patch-diff.githubusercontent.com/raw/kotatogram/kotatogram-desktop/pull/335.patch"
  "https://patch-diff.githubusercontent.com/raw/kotatogram/kotatogram-desktop/pull/337.patch"

  # tg_owt and patches
  "kotatogram-tg_owt"::"git+https://github.com/desktop-app/tg_owt.git#commit=${_tg_owt_commit}"

  "https://patch-diff.githubusercontent.com/raw/desktop-app/tg_owt/pull/101.patch"
  "tg_owt-fix.patch"

  # other patches
  "0001-Add-an-option-to-hide-messages-from-blocked-users-in.patch"
  "0002-Block-sponsored_messages.patch"
  "0003-Allow-downloading-and-copying-from-restricted-channels.patch"

  # submodules for kotatogram-desktop
  'apple.swift-corelibs-libdispatch'::'git+https://github.com/apple/swift-corelibs-libdispatch.git'
  'cyan4973.xxhash'::'git+https://github.com/Cyan4973/xxHash.git'
  'desktop-app.codegen'::'git+https://github.com/desktop-app/codegen.git'
  'desktop-app.lib_base'::'git+https://github.com/desktop-app/lib_base.git'
  'desktop-app.lib_crl'::'git+https://github.com/desktop-app/lib_crl.git'
  'desktop-app.lib_lottie'::'git+https://github.com/desktop-app/lib_lottie.git'
  'desktop-app.lib_qr'::'git+https://github.com/desktop-app/lib_qr.git'
  'desktop-app.lib_rpl'::'git+https://github.com/desktop-app/lib_rpl.git'
  'desktop-app.lib_spellcheck'::'git+https://github.com/desktop-app/lib_spellcheck.git'
  'desktop-app.lib_storage'::'git+https://github.com/desktop-app/lib_storage.git'
  'desktop-app.lib_tl'::'git+https://github.com/desktop-app/lib_tl.git'
  'desktop-app.lib_waylandshells'::'git+https://github.com/desktop-app/lib_waylandshells.git'
  'desktop-app.lib_webrtc'::'git+https://github.com/desktop-app/lib_webrtc.git'
  'desktop-app.lib_webview'::'git+https://github.com/desktop-app/lib_webview.git'
  'desktop-app.rlottie'::'git+https://github.com/desktop-app/rlottie.git'
  'ericniebler.range-v3'::'git+https://github.com/ericniebler/range-v3.git'
  'fcitx.fcitx-qt5'::'git+https://github.com/fcitx/fcitx-qt5.git'
  'fcitx.fcitx5-qt'::'git+https://github.com/fcitx/fcitx5-qt.git'
  'gitlab-freedesktop-mirrors.wayland-protocols'::'git+https://github.com/gitlab-freedesktop-mirrors/wayland-protocols.git'
  'hamonikr.nimf'::'git+https://github.com/hamonikr/nimf.git'
  'hime-ime.hime'::'git+https://github.com/hime-ime/hime.git'
  'hunspell'::'git+https://github.com/hunspell/hunspell.git'
  'jemalloc'::'git+https://github.com/jemalloc/jemalloc.git'
  'kde.extra-cmake-modules'::'git+https://github.com/KDE/extra-cmake-modules.git'
  'kde.kwayland'::'git+https://github.com/KDE/kwayland.git'
  'kde.plasma-wayland-protocols'::'git+https://github.com/KDE/plasma-wayland-protocols.git'
  'kotatogram.cmake_helpers'::'git+https://github.com/kotatogram/cmake_helpers.git'
  'kotatogram.lib_ui'::'git+https://github.com/kotatogram/lib_ui.git'
  'lz4'::'git+https://github.com/lz4/lz4.git'
  'microsoft.gsl'::'git+https://github.com/Microsoft/GSL.git'
  'nayuki.qr-code-generator'::'git+https://github.com/nayuki/QR-Code-generator.git'
  'tartanllama.expected'::'git+https://github.com/TartanLlama/expected.git'
  'telegramdesktop.libtgvoip'::'git+https://github.com/telegramdesktop/libtgvoip.git'
  'telegrammessenger.tgcalls'::'git+https://github.com/TelegramMessenger/tgcalls.git'

  # submodules for telegramdesktop.libtgvoip
  'desktop-app.cmake_helpers'::'git+https://github.com/desktop-app/cmake_helpers.git'

  # submodules for ericniebler.range-v3
  'ericniebler.range-v3'::'git+https://github.com/ericniebler/range-v3.git'

  # submodules for kotatogram-tg_owt
  'chromiumsrc.libyuv'::'git+https://gitlab.com/chromiumsrc/libyuv.git'
  'pipewire'::'git+https://github.com/PipeWire/pipewire.git'
)

sha256sums=(
  'SKIP'
  '133cde2fb9e1b5f837396e487783adf5e1899e20d335f1654a71e6ef1121918c'
  '25160a4a687b0032151f5c7a295996e4322b5c9ed1122dfa6c3985d57e866b2c'
  '289b69c980fe4877ab94d3b68180e586ffabecd15c4205f008fe21498d12f7ee'
  'd27016d67bd0baf5eb7c49ce1a0658e584d3892c344edde38843ca39a1d63a42'
  '533576f87db701100b2fda4b4ccbbb9957234d86447960a7c6b1dd07c8830d19'
  '26bd7d7e683dbf8d3fc7675afafac3fa3a140c21ca9087c8c98241a9041b981c'
  'b794229b2b2cec355219fe6d33dba1efd782dc9ad53c50ab90f5f682db370bea'

  'SKIP'
  'f4d26c1048a7fd1ac3419042009c3b52c001458e44309a765d42d7df9f45f1ef'
  '8d3a1c4b2e40eef7a4cc8e6f498c416af47a91b878ec3762b51476e89695cb13'

  '639b0b659685ff11daee21efd0ca0e473ee1cfb533709ea8ecf357945e058f43'
  '229c85f7fe86c11139b4d6b4fd44086d737e25ac94c89302aabe09eedb436f7e'
  'bb2aa0ec20d9769a513a41033a7f00baf08afd7a40c710431576d0f8b3a27a0e'

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

  'SKIP'

  'SKIP'

  'SKIP'
  'SKIP'
)

_pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags | sed 's/^k//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_prepare_kotatogram() (
  cd "${srcdir:?}/$_pkgsrc"
  local -A _submodules=(
    ['apple.swift-corelibs-libdispatch']='Telegram/ThirdParty/dispatch'
    ['cyan4973.xxhash']='Telegram/ThirdParty/xxHash'
    ['desktop-app.codegen']='Telegram/codegen'
    ['desktop-app.lib_base']='Telegram/lib_base'
    ['desktop-app.lib_crl']='Telegram/lib_crl'
    ['desktop-app.lib_lottie']='Telegram/lib_lottie'
    ['desktop-app.lib_qr']='Telegram/lib_qr'
    ['desktop-app.lib_rpl']='Telegram/lib_rpl'
    ['desktop-app.lib_spellcheck']='Telegram/lib_spellcheck'
    ['desktop-app.lib_storage']='Telegram/lib_storage'
    ['desktop-app.lib_tl']='Telegram/lib_tl'
    ['desktop-app.lib_waylandshells']='Telegram/lib_waylandshells'
    ['desktop-app.lib_webrtc']='Telegram/lib_webrtc'
    ['desktop-app.lib_webview']='Telegram/lib_webview'
    ['desktop-app.rlottie']='Telegram/ThirdParty/rlottie'
    ['ericniebler.range-v3']='Telegram/ThirdParty/range-v3'
    ['fcitx.fcitx-qt5']='Telegram/ThirdParty/fcitx-qt5'
    ['fcitx.fcitx5-qt']='Telegram/ThirdParty/fcitx5-qt'
    ['gitlab-freedesktop-mirrors.wayland-protocols']='Telegram/ThirdParty/wayland-protocols'
    ['hamonikr.nimf']='Telegram/ThirdParty/nimf'
    ['hime-ime.hime']='Telegram/ThirdParty/hime'
    ['hunspell']='Telegram/ThirdParty/hunspell'
    ['jemalloc']='Telegram/ThirdParty/jemalloc'
    ['kde.extra-cmake-modules']='Telegram/ThirdParty/extra-cmake-modules'
    ['kde.kwayland']='Telegram/ThirdParty/kwayland'
    ['kde.plasma-wayland-protocols']='Telegram/ThirdParty/plasma-wayland-protocols'
    ['kotatogram.cmake_helpers']='cmake'
    ['kotatogram.lib_ui']='Telegram/lib_ui'
    ['lz4']='Telegram/ThirdParty/lz4'
    ['microsoft.gsl']='Telegram/ThirdParty/GSL'
    ['nayuki.qr-code-generator']='Telegram/ThirdParty/QR'
    ['tartanllama.expected']='Telegram/ThirdParty/expected'
    ['telegramdesktop.libtgvoip']='Telegram/ThirdParty/libtgvoip'
    ['telegrammessenger.tgcalls']='Telegram/ThirdParty/tgcalls'
  )
  for key in ${!_submodules[@]} ; do
    git submodule init "${_submodules[${key}]}"
    git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
    git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
  done

  (
    # submodules for telegramdesktop.libtgvoip
    cd "Telegram/ThirdParty/libtgvoip"
    local -A _submodules=(
      ['desktop-app.cmake_helpers']='cmake'
    )
    for key in ${!_submodules[@]} ; do
      git submodule init "${_submodules[${key}]}"
      git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
      git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
    done
  )
  (
    # submodules for ericniebler.range-v3
    cd "Telegram/ThirdParty/range-v3"
    local -A _submodules=(
      ['ericniebler.range-v3']='doc/gh-pages'
    )
    for key in ${!_submodules[@]} ; do
      git submodule init "${_submodules[${key}]}"
      git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
      git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
    done
  )

  cd "${srcdir:?}/$_pkgsrc"
  apply-patch "${srcdir:?}/kf594.patch"
  apply-patch "${srcdir:?}/326.patch"
  apply-patch "${srcdir:?}/333.patch"
  apply-patch "${srcdir:?}/334.patch"
  apply-patch "${srcdir:?}/335.patch"
  apply-patch "${srcdir:?}/337.patch"

  apply-patch "${srcdir:?}/0001-Add-an-option-to-hide-messages-from-blocked-users-in.patch"
  apply-patch "${srcdir:?}/0002-Block-sponsored_messages.patch"
  apply-patch "${srcdir:?}/0003-Allow-downloading-and-copying-from-restricted-channels.patch"
)

_prepare_tg_owt() (
  cd "${srcdir:?}/kotatogram-tg_owt"
  local -A _submodules=(
    ['chromiumsrc.libyuv']='src/third_party/libyuv'
    ['pipewire']='src/third_party/pipewire'
  )
  for key in ${!_submodules[@]} ; do
    git submodule init "${_submodules[${key}]}"
    git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
  done

  git -c protocol.file.allow=always submodule update --recursive

  apply-patch "${srcdir:?}/101.patch"
  ## apply-patch "${srcdir:?}/include.patch"
  apply-patch "${srcdir:?}/tg_owt-fix.patch"
)

prepare() {
  apply-patch() {
    printf '\nApplying patch %s\n' "$1"
    patch -Np1 -F100 -i "$1"
  }

  _prepare_kotatogram
  _prepare_tg_owt
}

_build_tg_owt() (
  local _cmake_options=(
    -B "build-tg_owt"
    -S "kotatogram-tg_owt"
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON
    -DBUILD_SHARED_LIBS=OFF
    -DTG_OWT_PACKAGED_BUILD=ON

    -DCMAKE_C_FLAGS="${CFLAGS} -ffat-lto-objects"
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -ffat-lto-objects -I/usr/include/libdrm"
  )

  cmake "${_cmake_options[@]}"
  cmake --build "build-tg_owt"
)

_build_kotatogram() (
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX="/usr"
    -DTDESKTOP_API_TEST=ON
    -Dtg_owt_DIR="${srcdir:?}/build-tg_owt"
    -DDESKTOP_APP_QT6=OFF
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
)

build() {
  export CXXFLAGS+=" -Wp,-U_GLIBCXX_ASSERTIONS"
  export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig' # force build with ffmpeg4.4

  _build_tg_owt
  _build_kotatogram
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build
}
