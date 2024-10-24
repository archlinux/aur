# Maintainer: HurricanePootis <hurricanepootis@protonmail.com
# Contributor: Ersei <contact at ersei dot net>
# Contributer: Paul <paul@mrarm.io>

pkgbase=mcpelauncher-linux
pkgname=('mcpelauncher-linux' 'lib32-mcpelauncher-linux')
pkgver=1.1.1
pkgrel=1
pkgdesc="Minecraft: Pocket Edition launcher for Linux"
arch=('x86_64')
url="https://github.com/minecraft-linux/mcpelauncher-manifest"
license=('GPL-3.0-only')
makedepends=('git' 'cmake' 'clang' 'alsa-lib' 'mesa' 'libpulse' 'libxrandr' 'libxinerama' 'libxkbcommon' 'ibus' 'fcitx5' 'libxss' 'jack' 'pipewire' 'sndio'
		'lib32-alsa-lib' 'lib32-mesa' 'lib32-libpulse' 'lib32-libxrandr' 'lib32-libxinerama' 'lib32-libxkbcommon' 'lib32-libxss' 'lib32-jack' 'lib32-pipewire')
depends=('libx11' 'zlib' 'libpng' 'libevdev' 'libegl' 'qt6-base' 'qt6-declarative' 'qt6-webengine' 'systemd-libs' 'openssl' 'gcc-libs' 'glibc' 'lib32-systemd' 'lib32-libx11' 'lib32-zlib' 'lib32-glibc' 'lib32-gcc-libs' 'lib32-libpng' 'lib32-openssl' 'lib32-libevdev' 'lib32-libglvnd')
makedepends=(${makedepends[@]} ${depends[@]})

source=(
  "git+https://github.com/minecraft-linux/mcpelauncher-manifest.git#tag=v${pkgver}-qt6"
  'git+https://github.com/minecraft-linux/android-support-headers'
  'git+https://github.com/minecraft-linux/arg-parser'
  'git+https://github.com/minecraft-linux/base64'
  'git+https://github.com/minecraft-linux/cll-telemetry'
  'git+https://github.com/minecraft-linux/daemon-utils'
  'git+https://github.com/minecraft-linux/eglut'
  'git+https://github.com/minecraft-linux/epoll-shim'
  'git+https://github.com/minecraft-linux/file-picker'
  'git+https://github.com/minecraft-linux/file-util'
  'git+https://github.com/minecraft-linux/game-window'
  'git+https://github.com/minecraft-linux/libc-shim'
  'git+https://github.com/ChristopherHX/libjnivm'
  'git+https://github.com/MCMrARM/linux-gamepad'
  'git+https://github.com/minecraft-linux/logger'
  'git+https://github.com/minecraft-linux/mcpelauncher-client'
  'git+https://github.com/minecraft-linux/mcpelauncher-common'
  'git+https://github.com/minecraft-linux/mcpelauncher-core'
  'git+https://github.com/minecraft-linux/mcpelauncher-errorwindow'
  'git+https://github.com/minecraft-linux/mcpelauncher-linker'
  'git+https://github.com/minecraft-linux/mcpelauncher-linux-bin'
  'git+https://github.com/minecraft-linux/mcpelauncher-mac-bin'
  'git+https://github.com/minecraft-linux/mcpelauncher-webview'
  'git+https://github.com/minecraft-linux/minecraft-imported-symbols'
  'git+https://github.com/minecraft-linux/msa-daemon-client'
  'git+https://github.com/minecraft-linux/osx-elf-header'
  'git+https://github.com/minecraft-linux/properties-parser'
  'git+https://github.com/MCMrARM/simple-ipc'
  'git+https://github.com/minecraft-linux/android_bionic'
  'git+https://github.com/libsdl-org/SDL'
  'git+https://github.com/ocornut/imgui'
  # Temporary override of 'git+https://android.googlesource.com/platform/system/core'
  # git clone --mirror timed out on archlinux while it still works on ubuntu 22.04, the history has been truncated due to large files
  'git+https://github.com/minecraft-linux/android_core'
)

sha256sums=('7b6790a70856eb1d32e7d20722898639f8ae90fc8a9242b8f37b972b7499076b'
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
            'SKIP')

prepare() {
  git -C mcpelauncher-manifest submodule init
  git -C mcpelauncher-manifest config submodule.android-support-headers.url "$srcdir/android-support-headers"
  git -C mcpelauncher-manifest config submodule.arg-parser.url "$srcdir/arg-parser"
  git -C mcpelauncher-manifest config submodule.base64.url "$srcdir/base64"
  git -C mcpelauncher-manifest config submodule.cll-telemetry.url "$srcdir/cll-telemetry"
  git -C mcpelauncher-manifest config submodule.daemon-utils.url "$srcdir/daemon-utils"
  git -C mcpelauncher-manifest config submodule.eglut.url "$srcdir/eglut"
  git -C mcpelauncher-manifest config submodule.epoll-shim.url "$srcdir/epoll-shim"
  git -C mcpelauncher-manifest config submodule.file-picker.url "$srcdir/file-picker"
  git -C mcpelauncher-manifest config submodule.file-util.url "$srcdir/file-util"
  git -C mcpelauncher-manifest config submodule.game-window.url "$srcdir/game-window"
  git -C mcpelauncher-manifest config submodule.libc-shim.url "$srcdir/libc-shim"
  git -C mcpelauncher-manifest config submodule.libjnivm.url "$srcdir/libjnivm"
  git -C mcpelauncher-manifest config submodule.linux-gamepad.url "$srcdir/linux-gamepad"
  git -C mcpelauncher-manifest config submodule.logger.url "$srcdir/logger"
  git -C mcpelauncher-manifest config submodule.mcpelauncher-client.url "$srcdir/mcpelauncher-client"
  git -C mcpelauncher-manifest config submodule.mcpelauncher-common.url "$srcdir/mcpelauncher-common"
  git -C mcpelauncher-manifest config submodule.mcpelauncher-core.url "$srcdir/mcpelauncher-core"
  git -C mcpelauncher-manifest config submodule.mcpelauncher-errorwindow.url "$srcdir/mcpelauncher-errorwindow"
  git -C mcpelauncher-manifest config submodule.mcpelauncher-linker.url "$srcdir/mcpelauncher-linker"
  git -C mcpelauncher-manifest config submodule.mcpelauncher-linux-bin.url "$srcdir/mcpelauncher-linux-bin"
  git -C mcpelauncher-manifest config submodule.mcpelauncher-mac-bin.url "$srcdir/mcpelauncher-mac-bin"
  git -C mcpelauncher-manifest config submodule.mcpelauncher-webview.url "$srcdir/mcpelauncher-webview"
  git -C mcpelauncher-manifest config submodule.minecraft-imported-symbols.url "$srcdir/minecraft-imported-symbols"
  git -C mcpelauncher-manifest config submodule.msa-daemon-client.url "$srcdir/msa-daemon-client"
  git -C mcpelauncher-manifest config submodule.osx-elf-header.url "$srcdir/osx-elf-header"
  git -C mcpelauncher-manifest config submodule.properties-parser.url "$srcdir/properties-parser"
  git -C mcpelauncher-manifest config submodule.simple-ipc.url "$srcdir/simple-ipc"
  git -C mcpelauncher-manifest config submodule.sdl3.url "$srcdir/SDL"
  git -C mcpelauncher-manifest config submodule.imgui.url "$srcdir/imgui"
  git -C mcpelauncher-manifest -c protocol.file.allow=always submodule update
  git -C mcpelauncher-manifest/mcpelauncher-linker config submodule.bionic.url "$srcdir/android_bionic"
  # Workaround of git clone --mirror timeout commit sha of core doesn't match git repo
  #git -C mcpelauncher-manifest/mcpelauncher-linker config submodule.core.url "$srcdir/core"
  #git -C mcpelauncher-manifest/mcpelauncher-linker -c protocol.file.allow=always submodule update
  git -C mcpelauncher-manifest/mcpelauncher-linker config submodule.core.url "$srcdir/android_core"
  git -C mcpelauncher-manifest/mcpelauncher-linker -c protocol.file.allow=always submodule init
  git -C mcpelauncher-manifest/mcpelauncher-linker -c protocol.file.allow=always submodule update bionic
  GIT_DIR="$PWD/mcpelauncher-manifest/mcpelauncher-linker/core/.git" git -C mcpelauncher-manifest/mcpelauncher-linker/core -c protocol.file.allow=always fetch "$srcdir/android_core" HEAD && git -C mcpelauncher-manifest/mcpelauncher-linker/core checkout FETCH_HEAD || git -c protocol.file.allow=always clone "$srcdir/android_core" mcpelauncher-manifest/mcpelauncher-linker/core
}

build() {
	CXXFLAGS=$(echo $CXXFLAGS | sed 's/-Wp,-D_FORTIFY_SOURCE=3//g')
	CXXFLAGS+="$CXXFLAGS -flto=thin"
	CFLAGS+="$CFLAGS -flto=thin"
	_args=(
	-S mcpelauncher-manifest
	-DCMAKE_INSTALL_PREFIX=/usr
	-DCMAKE_C_COMPILER=clang
	-DCMAKE_CXX_COMPILER=clang++
	-DCMAKE_BUILD_TYPE=None
	-DENABLE_DEV_PATHS=OFF
	-Wno-dev
	)
	cmake -B build "${_args[@]}"
	cmake --build build

	_args+=(
	-DCMAKE_C_FLAGS="$CFLAGS -m32"
	-DCMAKE_CXX_FLAGS="$CXXFLAGS -m32"
	-DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS -m32"
	-DENABLE_QT_ERROR_UI=OFF
	-DENABLE_ERROR_WINDOW=OFF
	-DBUILD_WEBVIEW=OFF
	)
	PKG_CONFIG_PATH="/usr/lib32/pkgconfig" \
	cmake -B build32 "${_args[@]}"
	PKG_CONFIG_PATH="/usr/lib32/pkgconfig" \
	cmake --build build32
}

package_mcpelauncher-linux() {
  cd "$srcdir"
  DESTDIR="$pkgdir" cmake --install build
  depends=('libx11' 'zlib' 'libpng' 'libevdev' 'libegl' 'qt6-base' 'qt6-declarative' 'qt6-webengine' 'systemd-libs' 'openssl' 'gcc-libs' 'glibc')
  optdepends=('mcpelauncher-ui: GUI for Launcher'
		'pipewire: Pipewire Sound Driver'
		'libpulse: Pulseaudio Sound Driver'
		'jack: JACK Sound Driver'
		'alsa-lib: ALSA Sound Driver'
		'lib32-mcpelauncher-linux: x86 Game Support')
  provides=('mcpelauncher-client')
  install -Dm644 mcpelauncher-manifest/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 mcpelauncher-manifest/msa-daemon-client/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MIT"
  install -Dm644 mcpelauncher-manifest/mcpelauncher-linux-bin/FMod\ License.txt "$pkgdir/usr/share/licenses/$pkgname/fmod_license.txt"
  install -Dm644 mcpelauncher-manifest/eglut/LICENSE "$pkgdir/usr/share/licenses/$pkgname/eglut_license.txt"
}

package_lib32-mcpelauncher-linux() {
	depends=(lib32-systemd lib32-libx11 lib32-zlib lib32-glibc lib32-gcc-libs lib32-libpng lib32-openssl lib32-libevdev lib32-libglvnd lib32-libevdev)
	pkgdesc+=" (32bit client support)"
	optdepends=('lib32-pipewire: Pipewire Sound Driver'
	'lib32-libpulse: Pulseaudio Sound Driver'
	'lib32-jack: JACK Sound Driver'
	'lib32-alsa-lib: ALSA Sound Driver')
	cd "$srcdir"
	install -Dm755 "$srcdir/build32/mcpelauncher-client/mcpelauncher-client" "$pkgdir/usr/bin/mcpelauncher-client32"
}
