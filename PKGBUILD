# Maintainer: Sébastien TERRIER <ouinouin at ouinouin dot eu>
# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=sudachi
pkgver=1.0.15
pkgrel=4
pkgdesc="Nintendo Switch emulator forked from yuzu."
arch=(x86_64)
url=https://sudachi.emuplace.app
license=(GPL-3.0-or-later)
depends=('qt6-base' 'hicolor-icon-theme' 'brotli' 'zydis' 'libvdpau' 'libx11' 'openssl' 'libdrm' 'glibc' 'opus' 'systemd-libs' 'libva' 'gcc-libs' 'speexdsp')
makedepends=('git' 'cmake' 'doxygen' 'ninja' 'rapidjson' 'qt6-tools' 'qt6-multimedia' 'vulkan-headers' 'nasm' 'llvm' 'gamemode' 'zip' 'unzip')
optdepends=('gamemode: gamemoded support')
options=(!debug)
noextract=(sudachi-${pkgver}.zip)
source=(sudachi-${pkgver}.zip::https://github.com/emuplace/sudachi.emuplace.app/releases/download/v${pkgver}/latest.zip
	enet::git+https://github.com/lsalzman/enet#tag=v1.3.18
	dynarmic::git+https://github.com/sudachi-emu/dynarmic#commit=efa2ebefe1f502fc886cbbcebabed2506121eb24
	libusb::git+https://github.com/libusb/libusb#tag=v1.0.24
	discord-rpc::git+https://github.com/sudachi-emu/discord-rpc
	vulkan-headers::git+https://github.com/KhronosGroup/Vulkan-Headers#tag=v1.4.310
	sirit::git+https://github.com/sudachi-emu/sirit#commit=795ef4d8318c7d344da99c076dd60e5580d3d5ac
	mbedtls::git+https://github.com/sudachi-emu/mbedtls#commit=86ed7bfaa80079a97c763a651d0b2cd8d9d59100
	xbyak::git+https://github.com/herumi/xbyak#tag=v6.73
	opus::git+https://github.com/xiph/opus#tag=v1.3.1
	cpp-httplib::git+https://github.com/yhirose/cpp-httplib#commit=65ce51aed7f15e40e8fb6d2c0a8efb10bcb40126
	ffmpeg::git+https://github.com/FFmpeg/FFmpeg#tag=n7.1
	cpp-jwt::git+https://github.com/arun11299/cpp-jwt#tag=v1.4
	libadrenotools::git+https://github.com/bylaws/libadrenotools
	VulkanMemoryAllocator::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator#tag=v3.2.1
	breakpad::git+https://github.com/sudachi-emu/breakpad#commit=bf1260ddb8d405e95cd5c4507ddaca45d10dd842
	simpleini::git+https://github.com/brofield/simpleini
	oaknut::git+https://github.com/sudachi-emu/oaknut#commit=a3135650b39a9595d3852c4784d432c95a3b1af2
	Vulkan-Utility-Libraries::git+https://github.com/KhronosGroup/Vulkan-Utility-Libraries#tag=v1.4.310
	vcpkg::git+https://github.com/microsoft/vcpkg#tag=2025.02.14
	tzdb_to_nx::git+https://github.com/lat9nq/tzdb_to_nx
	cubeb::git+https://github.com/mozilla/cubeb
	SDL3::git+https://github.com/libsdl-org/sdl#tag=release-3.2.8
	googletest::git+https://github.com/google/googletest
	sanitizers-cmake::git+https://github.com/arsenm/sanitizers-cmake
	cubeb-coreaudio-rs::git+https://github.com/mozilla/cubeb-coreaudio-rs#branch=trailblazer
	cubeb-pulse-rs::git+https://github.com/mozilla/cubeb-pulse-rs#branch=dev
	linkernsbypass::git+https://github.com/bylaws/liblinkernsbypass#branch=master
	SPIRV-Headers::git+https://github.com/KhronosGroup/SPIRV-Headers#commit=c214f6f2d1a7253bb0e9f195c2dc5b0659dc99ef
	tz::git+https://github.com/eggert/tz
	zycore::git+https://github.com/zyantific/zycore-c)
	
b2sums=('deacfbf286580efea76745c973b497eaa83a27b8157cb3af978e8911ad94f2d428c98c1160fd56d99762670a6fd8a618f562c49c6b69661c6ff7cce5a912feda'
        '2a447d114b091b51a2bb1d20ab885a8ea02c19c2b4f24ae9e8af60275aedce9e652b05401a54002c7c5fc8790012fc7cd6c55006656fff21af558d3e79ccd877'
        '93a2d62c7c1371c48725ccd03f1c2b4b0d491bb58081238d73fe2d8592c4362a21560fa03f2507c0ef340fc61a06562e2789782a7694a506f62aaa792c987b73'
        '4274bb7227e90f3652bd7a5048ac0ff5b24d0c6a86cbaed1b02c18a84ee6ae5ade6a861bb9f4833166197d939f3745994cce15baed815098254e4ab2d3ea76af'
        'SKIP'
        '1c5899b459bf936250eed654e61bc108b3853e1847764a5a74176444ccebbb6e7a383ddac42ee3b2dc27f74e3a375f7c0360ab70585d3a2bf0602fee324b8db7'
        '4592c7d25bb118ffbe50307cfdea37c310a21da326fcf6132b563d892ea3cc4abef9a41c2e63dc015904c000829f4af6d1dfc475e97620f67a1fcb876d80c59e'
        '2dfddbebb1ae11e8e1a435f1e17721143e411f57af147667139983d5be5fdf5d633ebcfb70c94868b1cdd3c417b915020b2cd0c1398efcdfdb2ff19bf1ede37c'
        '0d89124eec3ac2acadfd91f8d34eebc75619b805eb9dbec52d99068e0ed4e57fa3b681e1ce9aaa11c3dcef18677d5ff56fae230f2af42ec1e4cb1118412c1483'
        'f262820a87d3840f9560430b05e70c9621580301b3f156fd187d82b567e95a9476c75cf5fbe888271097f95f428f45a11cd84e1ec00dd4dd8c2744d1f324b922'
        '8b19e4063fdfb623aa83c715ce499da17bea6159287eb60e8e11faa2e574b90eb1c6bc9ab3331231e15c03bc503bde542701494802dc7d9c5afa34d98ec2f086'
        'c7ec6b1db61608195117b79f3f0c8f6323c3abeb39721359da0f10e7d739da8301e04ff5fa83c022f86fc760f66e00066f9a50d97b771f797ccc679f9d912c40'
        'dfc79dd58a96d4166cbeb4b93c80d235989e7ccea07fdc804993c57201082f2298646693e41ad5ce794d882483a9f4015d0ca00efbdefbdcbc11e16f803cc602'
        'SKIP'
        'aca4f69aed630852f3aec4bdd4b6fd35935cc896c682e1b1d660bce0da54b40617889fa4a9ae788d49472be5bd12f9bf609f7a7a74ce5139ce904b8c8bd39976'
        '8938523994f0fd698c95fc196ae85114b3e5d38c76f33bc593e76e433a45a3350c0d8cf7f1c95fe3d0d59c43d69017bdcbe7f668ca563b6155ee8cce87fbf0c9'
        'SKIP'
        'f44c8b6d5b929999ddaeec5ea99fc02787056a0b0e7b68653b9b620dd714e0fe6334deb47ffc3774f03787cd1a147bc1b8c63dfb248c20de26247cd2e6b0a590'
        'a608b1aecd793e3c9d21badb9dc0e44067aab5084723698b880f946e0af61843bf808f45dcb017f5206e53f3cc2be57816fdf59950750a15865e20b7cc5fe54e'
        '53a96ba10063d90b6750896374847e5e5cafd47b9fc65bb71a6e0597362aa28806b834252d934d92da645a839b17234339b1b53f7d99eb3630bac75ff9a9d30a'
        'SKIP'
        'SKIP'
        '690393dc7f099d9f45a9727a41ed072c90c514853fdb401519886c034ca8ed7280a1e32c1dffd6971472638565f5f72eb2ffcde828ddd072a34eea790273df46'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '686239a1a777acde8e9ac22bf338dec5d553e6846919cfd8f907693774f335a44632c13dbbb5d1cdaba968c67edd88f20ec6dc4ee2d289a5f5149bf04bf4dad6'
        'SKIP'
        'SKIP')
        
prepare() {
  cd "$srcdir"
  [[ -d ${pkgname}-${pkgver} ]] && rm -rf ${pkgname}-${pkgver}
  bsdunzip -d ${pkgname}-${pkgver} ${pkgname}-${pkgver}.zip
  cd "$srcdir/${pkgname}-${pkgver}"
  git init
  
  for _submodule in enet dynarmic discord-rpc vulkan-headers sirit mbedtls xbyak opus cpp-httplib cpp-jwt libadrenotools VulkanMemoryAllocator breakpad simpleini oaknut Vulkan-Utility-Libraries vcpkg cubeb SDL3;
    do
      rm -rf externals/$_submodule
      git -c protocol.file.allow=always submodule add "${srcdir}/$_submodule" externals/$_submodule
    done
    
  rm -rf externals/libusb/libusb
  git -c protocol.file.allow=always submodule add "${srcdir}/libusb" externals/libusb/libusb
  
  rm -rf externals/ffmpeg/ffmpeg
  git -c protocol.file.allow=always submodule add "${srcdir}/ffmpeg" externals/ffmpeg/ffmpeg
  
  rm -rf externals/nx_tzdb/tzdb_to_nx
  git -c protocol.file.allow=always submodule add "${srcdir}/tzdb_to_nx" externals/nx_tzdb/tzdb_to_nx

  pushd externals/cubeb
    git config submodule.googletest.url "${srcdir}/googletest"
    git config submodule.cmake/sanitizers-cmake.url "${srcdir}/sanitizers-cmake"
    git config submodule.src/cubeb-coreaudio-rs.url "${srcdir}/cubeb-coreaudio-rs"
    git config submodule.src/cubeb-pulse-rs.url "${srcdir}/cubeb-pulse-rs"
    git -c protocol.file.allow=always submodule update
  popd
  
  pushd externals/libadrenotools
    git config submodule.lib/linkernsbypass.url "${srcdir}/linkernsbypass"
    git -c protocol.file.allow=always submodule update
  popd
  
  pushd externals/sirit
    git config submodule.externals/SPIRV-Headers.url "${srcdir}/SPIRV-Headers"
    git -c protocol.file.allow=always submodule update
  popd
  
  pushd externals/nx_tzdb/tzdb_to_nx
    git config submodule.externals/tz/tz.url "${srcdir}/tz"
    git -c protocol.file.allow=always submodule update
  popd
  
  pushd externals/dynarmic/externals/zydis
    git config submodule.dependencies/zycore.url "${srcdir}/zycore"
    git -c protocol.file.allow=always submodule update
  popd
  
  sed -i 's/\bwindow\b/render_window/g' "${srcdir}/${pkgname}-${pkgver}/src/sudachi_cmd/emu_window/emu_window_sdl3_vk.cpp"
  sed -i '/namespace {/d' "${srcdir}/${pkgname}-${pkgver}/src/core/guest_memory.h"
  sed -i '/} \/\/ namespace Core::Memory/d' "${srcdir}/${pkgname}-${pkgver}/src/core/guest_memory.h"
  #sed -i "s/find_package(FFmpeg 4.3/find_package(FFmpeg 4.4/g" "${srcdir}/${pkgname}-${pkgver}/CMakeLists.txt"
  
  # make some corrections for cmake 4.0
  sed -i '/"overrides": \[/a \        {\n            "name": "lz4",\n            "version": "1.10.0"\n        },' vcpkg.json
}

build() {
  export VCPKG_DISABLE_METRICS=1
  export VCPKG_C_FLAGS="$CFLAGS"
  export VCPKG_CXX_FLAGs="$CXXFLAGS"
  cd "$srcdir"
  cmake -B build -GNinja \
    -S "${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=None \
    -DSUDACHI_TESTS=OFF \
    -DENABLE_QT6=ON \
    -DENABLE_QT_TRANSLATION=ON \
    -DSUDACHI_USE_BUNDLED_VCPKG=ON \
    -DSUDACHI_USE_BUNDLED_FFMPEG=ON \
    -DSUDACHI_USE_QT_MULTIMEDIA=OFF \
    -DSUDACHI_USE_QT_WEB_ENGINE=OFF \
    -DUSE_DISCORD_PRESENCE=OFF \
    -DSUDACHI_DOWNLOAD_TIME_ZONE_DATA=OFF \
    -DSUDACHI_USE_BUNDLED_QT=OFF \
    -DUSE_SDL3_FROM_EXTERNALS=OFF \
    -DSUDACHI_USE_BUNDLED_SDL3=OFF \
    -DSUDACHI_ENABLE_LTO=ON \
    -DSUDACHI_USE_FASTER_LD=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS --param=destructive-interference-size=64 -Wno-unused-variable -msse4.1" \
    -DCMAKE_C_FLAGS="$CFLAGS --param=destructive-interference-size=64 -Wno-unused-variable -msse4.1" \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DTITLE_BAR_FORMAT_RUNNING="sudachi | ${pkgver} {}" \
    -DTITLE_BAR_FORMAT_IDLE="sudachi | ${pkgver} {}" \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5

  cmake --build build
}

package() {
  cd "$srcdir"
  DESTDIR="$pkgdir/" cmake --install build
  cd "$srcdir/${pkgname}-${pkgver}/LICENSES"
  for file in *.txt;
  do
    install -Dm644 $file "$pkgdir/usr/share/licenses/$pkgname/$file"
  done
  install -Dm644 "$srcdir/$pkgname-$pkgver/dist/72-sudachi-input.rules" "$pkgdir/usr/lib/udev/rules.d/72-sudachi-input-rules"
}
