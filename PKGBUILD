# Maintainer: Ersei <samb at disroot dot org>
# Contributer: Paul <paul@mrarm.io>

pkgname=mcpelauncher-linux-git
pkgver=v0.7.0.qt6.r1.ge643112
pkgrel=1
pkgdesc="Minecraft: Pocket Edition launcher for Linux"
arch=('x86_64' 'i686')
url="https://github.com/minecraft-linux/mcpelauncher-manifest"
license=('GPL3' 'custom')
makedepends_x86_64=('git' 'cmake' 'clang')
depends_x86_64=('curl' 'libx11' 'zlib' 'libpng' 'libevdev' 'systemd' 'libxi' 'libegl' 'qt6-base' 'qt6-declarative' 'qt6-webengine' 'libuv')
optdepends=('mcpelauncher-msa: Xbox Live support')
provides=('mcpelauncher-client')
conflicts=('mcpelauncher-client')

source=(
  'git+https://github.com/minecraft-linux/mcpelauncher-manifest.git#branch=qt6'
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
  'git+https://android.googlesource.com/platform/system/core'
)

md5sums=(
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

pkgver() {
  git -C mcpelauncher-manifest describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

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
  git -C mcpelauncher-manifest -c protocol.file.allow=always submodule update
  git -C mcpelauncher-manifest/mcpelauncher-linker config submodule.bionic.url "$srcdir/android_bionic"
  git -C mcpelauncher-manifest/mcpelauncher-linker config submodule.core.url "$srcdir/core"
  git -C mcpelauncher-manifest/mcpelauncher-linker -c protocol.file.allow=always submodule update
}

build() {
  CC=clang CXX=clang++ cmake -S mcpelauncher-manifest -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo -DENABLE_DEV_PATHS=OFF -Wno-dev
  CC=clang CXX=clang++ cmake --build build --parallel
}

package() {
  make -C build DESTDIR="$pkgdir" install
  if [[ $CARCH == "i686" ]]; then
    mv "$pkgdir/usr/bin/mcpelauncher-client" "$pkgdir/usr/bin/mcpelauncher-client32"
  fi

  install -Dm644 mcpelauncher-manifest/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 mcpelauncher-manifest/msa-daemon-client/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MIT"
  install -Dm644 mcpelauncher-manifest/mcpelauncher-linux-bin/FMod\ License.txt "$pkgdir/usr/share/licenses/$pkgname/fmod_license.txt"
  install -Dm644 mcpelauncher-manifest/eglut/LICENSE "$pkgdir/usr/share/licenses/$pkgname/eglut_license.txt"
}
