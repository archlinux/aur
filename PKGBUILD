# Maintainer: HurricanePootis <hurricanepootis@protonmail.com
# Contributor: Ersei <contact at ersei dot net>
# Contributer: Paul <paul@mrarm.io>

pkgbase=mcpelauncher-linux
pkgname=('mcpelauncher-linux' 'lib32-mcpelauncher-linux')
pkgver=1.5.5
pkgrel=1
pkgdesc="Minecraft: Pocket Edition launcher for Linux"
arch=('x86_64')
url="https://github.com/minecraft-linux/mcpelauncher-manifest"
license=('GPL-3.0-only')
_makedepends=('git' 'cmake' 'ninja' 'clang' 'wayland-protocols' 'lld')
_depends=('zlib' 'libpng' 'sdl3' 'qt6-base' 'qt6-declarative' 'qt6-webengine' 'openssl' 'gcc-libs' 'glibc')
_32depends=('lib32-zlib' 'lib32-libpng' 'lib32-sdl3' 'lib32-openssl' 'lib32-gcc-libs' 'lib32-glibc')
depends=(${_depends[@]} ${_32depends[@]})
makedepends=(${_makedepends[@]} ${depends[@]})
source=(
  "git+https://github.com/minecraft-linux/mcpelauncher-manifest.git#tag=v${pkgver}-qt6"
  'git+https://github.com/minecraft-linux/android-support-headers.git'
  'git+https://github.com/minecraft-linux/arg-parser.git'
  'git+https://github.com/minecraft-linux/base64.git'
  'git+https://github.com/minecraft-linux/cll-telemetry.git'
  'git+https://github.com/minecraft-linux/daemon-utils.git'
  'git+https://github.com/minecraft-linux/eglut.git'
  'git+https://github.com/minecraft-linux/epoll-shim.git'
  'git+https://github.com/minecraft-linux/file-picker.git'
  'git+https://github.com/minecraft-linux/file-util.git'
  'git+https://github.com/minecraft-linux/game-window.git'
  'git+https://github.com/ocornut/imgui.git'
  'git+https://github.com/minecraft-linux/libc-shim.git'
  'git+https://github.com/ChristopherHX/libjnivm.git'
  'git+https://github.com/MCMrARM/linux-gamepad.git'
  'git+https://github.com/minecraft-linux/logger.git'
  'git+https://github.com/minecraft-linux/mcpelauncher-client.git'
  'git+https://github.com/minecraft-linux/mcpelauncher-common.git'
  'git+https://github.com/minecraft-linux/mcpelauncher-core.git'
  'git+https://github.com/minecraft-linux/mcpelauncher-errorwindow.git'
  'git+https://github.com/minecraft-linux/mcpelauncher-linker.git'
  'git+https://github.com/minecraft-linux/mcpelauncher-linux-bin.git'
  'git+https://github.com/minecraft-linux/mcpelauncher-mac-bin.git'
  'git+https://github.com/minecraft-linux/mcpelauncher-webview.git'
  'git+https://github.com/minecraft-linux/minecraft-imported-symbols.git'
  'git+https://github.com/minecraft-linux/msa-daemon-client.git'
  'git+https://github.com/minecraft-linux/osx-elf-header.git'
  'git+https://github.com/minecraft-linux/properties-parser.git'
  'git+https://github.com/MCMrARM/simple-ipc.git'
  'git+https://github.com/minecraft-linux/android_bionic.git'
  'git+https://github.com/libsdl-org/SDL.git'
  # Temporary override of 'git+https://android.googlesource.com/platform/system/core'
  # git clone --mirror timed out on archlinux while it still works on ubuntu 22.04, the history has been truncated due to large files
  'git+https://github.com/minecraft-linux/android_core'
)

sha256sums=('198080dbcb28906ca2d27b91ad6f798d977666a2933ab4a6e2cbc4ae25b4b36d'
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
  # Submodules of submodules
  git -C mcpelauncher-manifest/mcpelauncher-linker config submodule.bionic.url "$srcdir/android_bionic"
  git -C mcpelauncher-manifest/mcpelauncher-linker config submodule.core.url "$srcdir/android_core"
  git -C mcpelauncher-manifest/mcpelauncher-linker -c protocol.file.allow=always submodule update
}

build() {
	CXXFLAGS="$(echo $CXXFLAGS | sed 's/-Wp,-D_FORTIFY_SOURCE=3//g') -DNDEBUG -flto=thin"
	CFLAGS+=" -flto=thin"
	LDFLAGS+=" -fuse-ld=lld"
	_args=(
	-S mcpelauncher-manifest
	-G Ninja
	-DCMAKE_INSTALL_PREFIX=/usr
	-DCMAKE_C_COMPILER=clang
	-DCMAKE_CXX_COMPILER=clang++
	-DCMAKE_BUILD_TYPE=None
	-DENABLE_DEV_PATHS=OFF
	-DGAMEWINDOW_SYSTEM=SDL3
	-DSDL3_VENDORED=OFF
	-DCMAKE_POLICY_VERSION_MINIMUM=3.5
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
  depends=(${_depends[@]})
  optdepends=('mcpelauncher-ui: GUI for Launcher'
		'lib32-mcpelauncher-linux: x86 Game Support')
  provides=('mcpelauncher-client')
  install -Dm644 mcpelauncher-manifest/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 mcpelauncher-manifest/msa-daemon-client/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MIT"
  install -Dm644 mcpelauncher-manifest/mcpelauncher-linux-bin/FMod\ License.txt "$pkgdir/usr/share/licenses/$pkgname/fmod_license.txt"
  install -Dm644 mcpelauncher-manifest/eglut/LICENSE "$pkgdir/usr/share/licenses/$pkgname/eglut_license.txt"
}

package_lib32-mcpelauncher-linux() {
	depends=(${_32depends[@]})
	pkgdesc+=" (32bit client support)"
	cd "$srcdir"
	install -Dm755 "$srcdir/build32/mcpelauncher-client/mcpelauncher-client" "$pkgdir/usr/bin/mcpelauncher-client32"
}
