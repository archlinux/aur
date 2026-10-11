# Maintainer: Good Vibes <good_vibes@fastmail.com>
pkgname=anyps5
pkgver=0.1.1
pkgrel=1
pkgdesc='Tool for porting PS5 executables to Linux and Windows'
arch=('x86_64')
url='https://github.com/boykopovar/AnyPS5'
license=('GPL-2.0-only')
depends=('glibc' 'gcc-libs' 'libx11' 'libxext' 'libxcursor' 'libxi' 'libxfixes' 'libxrandr' 'libxss'
         'alsa-lib' 'libpulse' 'systemd-libs' 'dbus' 'vulkan-icd-loader')
makedepends=('cmake' 'ninja' 'python')
optdepends=('vulkan-driver: Vulkan GPU driver for running converted applications')
# PRX exports are rewritten by nid_patcher; preserve the resulting binaries.
options=('!strip' '!debug' '!lto')
source=(
  'README.md'
  'AnyPS5-fe1935ef682d0b6fb94c0a3554a531b695302a8c.tar.gz::https://codeload.github.com/boykopovar/AnyPS5/tar.gz/fe1935ef682d0b6fb94c0a3554a531b695302a8c'
  'LibAtrac9-ec8899dadf393f655f2871a94e0fe4b3d6220c9a.tar.gz::https://codeload.github.com/shadps4-emu/ext-LibAtrac9/tar.gz/ec8899dadf393f655f2871a94e0fe4b3d6220c9a'
  'SDL2-4b69833bc54abf3dd3288d4aa7afbba527775e5b.tar.gz::https://codeload.github.com/libsdl-org/SDL/tar.gz/4b69833bc54abf3dd3288d4aa7afbba527775e5b'
  'SPIRV-Headers-01e0577914a75a2569c846778c2f93aa8e6feddd.tar.gz::https://codeload.github.com/KhronosGroup/SPIRV-Headers/tar.gz/01e0577914a75a2569c846778c2f93aa8e6feddd'
  'SPIRV-Tools-7f2d9ee926f98fc77a3ed1e1e0f113b8c9c49458.tar.gz::https://codeload.github.com/KhronosGroup/SPIRV-Tools/tar.gz/7f2d9ee926f98fc77a3ed1e1e0f113b8c9c49458'
  'Vulkan-Headers-2fa203425eb4af9dfc6b03f97ef72b0b5bcb8350.tar.gz::https://codeload.github.com/KhronosGroup/Vulkan-Headers/tar.gz/2fa203425eb4af9dfc6b03f97ef72b0b5bcb8350'
  'VulkanMemoryAllocator-a1d434708c217b2a6c7b365f1fe41fa03a562e59.tar.gz::https://codeload.github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator/tar.gz/a1d434708c217b2a6c7b365f1fe41fa03a562e59'
  'freetype-42608f77f20749dd6ddc9e0536788eaad70ea4b5.tar.gz::https://codeload.github.com/freetype/freetype/tar.gz/42608f77f20749dd6ddc9e0536788eaad70ea4b5'
  'glslang-ba1640446f3826a518721d1f083f3a8cca1120c3.tar.gz::https://codeload.github.com/KhronosGroup/glslang/tar.gz/ba1640446f3826a518721d1f083f3a8cca1120c3'
)
sha256sums=(
  'cbf29f6d84cce26125250d5e0880d401d4a3c0f85dbf650684b5e2a8deb3aa4f'
  '877e6c25f2da05aae13d4810cf64b1838376ebb25b2b2323ce95572426bdbc5c'
  '6210a9013060857d28804aa46c7c3ad2cebbdd38f259e6017e9d21c2fa1f37f5'
  '46237ea6c05cbcd11ef374382e91a4854aa15de2cf055aa061862ad1438003d7'
  '494bd30dc13ba798af70edd989f8df82c90757c8ce9433598480f5e00e04c454'
  '0a92e4be5c0a60203048fcbfaa95061b1838038e62ccd57d7a6f17539d6d6daa'
  '66e0dc7932203def85d94bf65a4fa3a3b29e61366713404f0465cdeb02e6ffd3'
  '850406caac450abd5eb4d9988d45229587232f96ddc10f5e0fcb5568237e9dcd'
  '68ce87bb59ea209eb7350f41a94a27519ce16b37011b475a1e62d4abee154b66'
  '406315c7b52e107f48d289447051a3e63d2ccc24a1f119b1474f2eb9f0934c9f'
)

prepare() {
  cp -a "ext-LibAtrac9-ec8899dadf393f655f2871a94e0fe4b3d6220c9a/." "AnyPS5-fe1935ef682d0b6fb94c0a3554a531b695302a8c/3rdparty/LibAtrac9/"
  cp -a "SDL-4b69833bc54abf3dd3288d4aa7afbba527775e5b/." "AnyPS5-fe1935ef682d0b6fb94c0a3554a531b695302a8c/3rdparty/SDL2/"
  cp -a "SPIRV-Headers-01e0577914a75a2569c846778c2f93aa8e6feddd/." "AnyPS5-fe1935ef682d0b6fb94c0a3554a531b695302a8c/3rdparty/SPIRV-Headers/"
  cp -a "SPIRV-Tools-7f2d9ee926f98fc77a3ed1e1e0f113b8c9c49458/." "AnyPS5-fe1935ef682d0b6fb94c0a3554a531b695302a8c/3rdparty/SPIRV-Tools/"
  cp -a "Vulkan-Headers-2fa203425eb4af9dfc6b03f97ef72b0b5bcb8350/." "AnyPS5-fe1935ef682d0b6fb94c0a3554a531b695302a8c/3rdparty/Vulkan-Headers/"
  cp -a "VulkanMemoryAllocator-a1d434708c217b2a6c7b365f1fe41fa03a562e59/." "AnyPS5-fe1935ef682d0b6fb94c0a3554a531b695302a8c/3rdparty/VulkanMemoryAllocator/"
  cp -a "freetype-42608f77f20749dd6ddc9e0536788eaad70ea4b5/." "AnyPS5-fe1935ef682d0b6fb94c0a3554a531b695302a8c/3rdparty/freetype/"
  cp -a "glslang-ba1640446f3826a518721d1f083f3a8cca1120c3/." "AnyPS5-fe1935ef682d0b6fb94c0a3554a531b695302a8c/3rdparty/glslang/"
}

build() {
  cmake -S "AnyPS5-fe1935ef682d0b6fb94c0a3554a531b695302a8c" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DSDL_JACK=OFF \
    -DSDL_PIPEWIRE=OFF \
    -DSDL_SNDIO=OFF \
    -DSDL_LIBSAMPLERATE=OFF \
    -DBUILD_TESTING=OFF
  cmake --build build --target relinker libs
}

check() {
  local test
  for test in optional_plt empty_tls tls_function_coverage linux_load_alignment windows_gui; do
    python "AnyPS5-fe1935ef682d0b6fb94c0a3554a531b695302a8c/core/relinker/relinker/tests/test_${test}.py" \
      "$srcdir/build/core/relinker/relinker"
  done
}

package() {
  install -Dm755 build/core/relinker/relinker "$pkgdir/usr/bin/relinker"
  install -dm755 "$pkgdir/usr/lib/anyps5"
  install -m755 build/core/libs/libs/*.prx "$pkgdir/usr/lib/anyps5/"
  install -Dm644 "AnyPS5-fe1935ef682d0b6fb94c0a3554a531b695302a8c/README.md" "$pkgdir/usr/share/doc/$pkgname/README.upstream.md"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
