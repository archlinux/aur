# Maintainer: Ersei <samb at disroot dot org>
# Contributer: Paul <paul@mrarm.io>

pkgname=mcpelauncher-linux-git
pkgver=v0.4.0.r2.g4c7dadf
pkgrel=1
pkgdesc="Minecraft: Pocket Edition launcher for Linux"
arch=('x86_64' 'i686')
url="https://github.com/minecraft-linux/mcpelauncher-manifest"
license=('GPL3' 'custom')
makedepends_x86_64=('git' 'cmake' 'clang')
depends_x86_64=('curl' 'libx11' 'zlib' 'libpng' 'libevdev' 'systemd' 'libxi' 'libegl' 'qt5-webengine' 'libuv')
optdepends=('mcpelauncher-msa: Xbox Live support')
provides=('mcpelauncher-client')
conflicts=('mcpelauncher-client')

source=(
  'git+https://github.com/minecraft-linux/mcpelauncher-manifest.git#branch=ng'
  'git+https://github.com/minecraft-linux/android-support-headers'
  'git+https://github.com/minecraft-linux/arg-parser'
  'git+https://github.com/minecraft-linux/baron'
  'git+https://github.com/minecraft-linux/base64'
  'git+https://github.com/minecraft-linux/cll-telemetry'
  'git+https://github.com/minecraft-linux/daemon-utils'
  'git+https://github.com/minecraft-linux/eglut'
  'git+https://github.com/minecraft-linux/epoll-shim'
  'git+https://github.com/minecraft-linux/fake-jni'
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
  'git+https://github.com/freundTech/mcpelauncher-webview'
  'git+https://github.com/minecraft-linux/minecraft-imported-symbols'
  'git+https://github.com/minecraft-linux/msa-daemon-client'
  'git+https://github.com/minecraft-linux/osx-elf-header'
  'git+https://github.com/minecraft-linux/properties-parser'
  'git+https://github.com/MCMrARM/simple-ipc'
  'git+https://github.com/minecraft-linux/CX'
  'git+https://github.com/libffi/libffi'
  'git+https://github.com/libunwind/libunwind'
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
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd mcpelauncher-manifest || exit 1
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd mcpelauncher-manifest || exit 1
  git submodule init
  git config submodule.android-support-headers.url "$srcdir/android-support-headers"
  git config submodule.arg-parser.url "$srcdir/arg-parser"
  git config submodule.baron.url "$srcdir/baron"
  git config submodule.base64.url "$srcdir/base64"
  git config submodule.cll-telemetry.url "$srcdir/cll-telemetry"
  git config submodule.daemon-utils.url "$srcdir/daemon-utils"
  git config submodule.eglut.url "$srcdir/eglut"
  git config submodule.epoll-shim.url "$srcdir/epoll-shim"
  git config submodule.fake-jni.url "$srcdir/fake-jni"
  git config submodule.file-picker.url "$srcdir/file-picker"
  git config submodule.file-util.url "$srcdir/file-util"
  git config submodule.game-window.url "$srcdir/game-window"
  git config submodule.libc-shim.url "$srcdir/libc-shim"
  git config submodule.libjnivm.url "$srcdir/libjnivm"
  git config submodule.linux-gamepad.url "$srcdir/linux-gamepad"
  git config submodule.logger.url "$srcdir/logger"
  git config submodule.mcpelauncher-client.url "$srcdir/mcpelauncher-client"
  git config submodule.mcpelauncher-common.url "$srcdir/mcpelauncher-common"
  git config submodule.mcpelauncher-core.url "$srcdir/mcpelauncher-core"
  git config submodule.mcpelauncher-errorwindow.url "$srcdir/mcpelauncher-errorwindow"
  git config submodule.mcpelauncher-linker.url "$srcdir/mcpelauncher-linker"
  git config submodule.mcpelauncher-linux-bin.url "$srcdir/mcpelauncher-linux-bin"
  git config submodule.mcpelauncher-mac-bin.url "$srcdir/mcpelauncher-mac-bin"
  git config submodule.mcpelauncher-webview.url "$srcdir/mcpelauncher-webview"
  git config submodule.minecraft-imported-symbols.url "$srcdir/minecraft-imported-symbols"
  git config submodule.msa-daemon-client.url "$srcdir/msa-daemon-client"
  git config submodule.osx-elf-header.url "$srcdir/osx-elf-header"
  git config submodule.properties-parser.url "$srcdir/properties-parser"
  git config submodule.simple-ipc.url "$srcdir/simple-ipc"
  git submodule update --recursive
  cd fake-jni || exit 1
  git config submodule.CX.url "$srcdir/CX"
  git config submodule.libffi.url "$srcdir/libffi"
  git config submodule.libunwind.url "$srcdir/libunwind"
  git submodule update --recursive
  cd ../mcpelauncher-linker || exit 1
  git config submodule.bionic.url "$srcdir/android_bionic"
  git config submodule.core.url "$srcdir/core"
  git submodule update --recursive
}

build() {
  cd mcpelauncher-manifest || exit 1
  # Hacky solution to fix compile
  #sed -i '22i#include <mutex>' mcpelauncher-linker/core/liblog/logger_write.cpp
  #sed -i '26i#include <limits>' mcpelauncher-linker/core/libziparchive/zip_archive_stream_entry.cc
  mkdir -p build
  cd build || exit
  CC=clang CXX=clang++ cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo -DENABLE_DEV_PATHS=OFF -Wno-dev ..
  CC=clang CXX=clang++ make
}

package() {
  cd mcpelauncher-manifest/build || exit 1
  make DESTDIR="$pkgdir" install
  if [[ $CARCH == "i686" ]]; then
    mv "$pkgdir/usr/bin/mcpelauncher-client" "$pkgdir/usr/bin/mcpelauncher-client32"
  fi

  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 ../msa-daemon-client/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MIT"
  install -Dm644 ../mcpelauncher-linux-bin/FMod\ License.txt "$pkgdir/usr/share/licenses/$pkgname/fmod_license.txt"
  install -Dm644 ../eglut/LICENSE "$pkgdir/usr/share/licenses/$pkgname/eglut_license.txt"
}
