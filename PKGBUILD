# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=rpcs3
pkgver=0.0.20
pkgrel=2
pkgdesc='Open-source Sony PlayStation 3 Emulator'
arch=(x86_64)
url=https://rpcs3.net
license=(GPL2)
depends=(alsa-lib glew glu libavcodec.so libavutil.so libevdev libgl libice libncursesw.so libpng libpulse libsm libswscale.so libx11 libxext openal qt5-base qt5-declarative qt5-multimedia qt5-svg sdl2 vulkan-icd-loader zlib curl)
makedepends=(cmake git libglvnd python vulkan-validation-layers)
options=(!emptydirs)

_pkgname="${pkgname}-${pkgver}"
_hidapi_commit=01f601a1509bf9c67819fbf521df39644bab52d5
_llvm_commit=1c0ca194dc501ffb1674868babf8bd52658a0734
_yaml_cpp_commit=0b67821f307e8c6bf0eba9b6d3250e3cf1441450
_xxHash_commit=35b0373c697b5f160d3db26b1cbb45a0d5ba788c
_FAudio_commit=caf9754455b8ad0f6df5d024203940e9b6e3f47e
_flatbuffers_commit=a9a295fecf3fbd5a4f571f53b01f63202a3e2113
_glslang_commit=c9706bdda0ac22b9856f1aa8261e5b9e15cd20c5
_SPIRV_Headers_commit=3fdabd0da2932c276b25b9b4a988ba134eba1aa6
_SPIRV_Tools_commit=895927bd3f2d653f40cebab55aa6c7eabde30a86
_asmjit_commit=eae7197fce03fd52a6e71ca89207a88ce270fb1a
_libusb_commit=c33990a300674e24f47ff0f172f7efb10b63b88a
_wolfssl_commit=723ed009ae5dc68acc14cd7664f93503d64cd51d
_pugixml_commit=08b3433180727ea2f78fe02e860a08471db1e03c
_cubeb_commit=d512bfa07a327e0ae7e7aef892dcce01cbeaa67c

source=(
    rpcs3-v${pkgver}.tar.gz::https://github.com/RPCS3/rpcs3/archive/refs/tags/v${pkgver}.tar.gz
    rpcs3-hidapi-${_hidapi_commit}.tar.gz::https://github.com/RPCS3/hidapi/archive/${_hidapi_commit}.tar.gz
    rpcs3-llvm-${_llvm_commit}.tar.gz::https://github.com/RPCS3/llvm-mirror/archive/${_llvm_commit}.tar.gz
    rpcs3-yaml-cpp-${_yaml_cpp_commit}.tar.gz::https://github.com/RPCS3/yaml-cpp/archive/${_yaml_cpp_commit}.tar.gz
    xxHash-${_xxHash_commit}.tar.gz::https://github.com/Cyan4973/xxHash/archive/${_xxHash_commit}.tar.gz
    FAudio-${_FAudio_commit}.tar.gz::https://github.com/FNA-XNA/FAudio/archive/${_FAudio_commit}.tar.gz
    flatbuffers-${_flatbuffers_commit}.tar.gz::https://github.com/google/flatbuffers/archive/${_flatbuffers_commit}.tar.gz
    glslang-${_glslang_commit}.tar.gz::https://github.com/KhronosGroup/glslang/archive/${_glslang_commit}.tar.gz
    SPIRV-Headers-${_SPIRV_Headers_commit}.tar.gz::https://github.com/KhronosGroup/SPIRV-Headers/archive/${_SPIRV_Headers_commit}.tar.gz
    SPIRV-Tools-${_SPIRV_Tools_commit}.tar.gz::https://github.com/KhronosGroup/SPIRV-Tools/archive/${_SPIRV_Tools_commit}.tar.gz
    asmjit-${_asmjit_commit}.tar.gz::https://github.com/asmjit/asmjit/archive/${_asmjit_commit}.tar.gz
    libusb-${_libusb_commit}.tar.gz::https://github.com/libusb/libusb/archive/${_libusb_commit}.tar.gz
    wolfssl-${_wolfssl_commit}.tar.gz::https://github.com/wolfSSL/wolfssl/archive/${_wolfssl_commit}.tar.gz
    pugixml-${_pugixml_commit}.tar.gz::https://github.com/zeux/pugixml/archive/${_pugixml_commit}.tar.gz
    cubeb-${_cubeb_commit}.tar.gz::https://github.com/mozilla/cubeb/archive/${_cubeb_commit}.tar.gz
)

b2sums=(
    'e9bf6183eb1c08da750b9810499a8a44e40f86db88ae2d0536d89b4221975d4d91df43fb5f7f59cc36d61e25260589d42545247688c190586a6166786129d59a'
    '91307db9de00d79fb9545724e6dada88361addb01ee7f379c7b44a4f4dc0b19bf9e25aec3eac2e41d21704b9888023078cbc34f898ffc8f419176ed031441bea'
    '2b83216dd92e94e9b6c23ed119bd7cfcd773110d7fba9dcabe2aeeffd04b79d4162b80a39f8982e93df294079fa4d74ceff03373a9cfb109da864d70801b493b'
    '856fbfb254e6afdd78197182fb550e0428aff1c284675fbe2e7b6d5bcac3e9f06fb944dcfaaa13bb139d5920dd4546a4d57140b56f41a51dee6a9f00c2784a5b'
    '1cc8108c711b52222aeae2e3feef747d67fa0656e84886c5671aa1fc5394c152afc282251959adcb80e62cf23e0af8fe7b6004e09cc213857f3a3f6b82bbda53'
    'd9f532df68cb6a54d3718f7daef4d19fa9e66bbc28a561f749d704c2821b3eec0f61e810a1d6ee345c767b3e896b1d39eec7d6814958af994532f413529ebb67'
    '64679e63ed12c2a52e71423bcb6c8e4fc1e6aaf64013f1e1e619046a9dc08ed70e84cdb8f819a6496e692ef3ff72aa4761a562d2b73705d908374728ef7c5fa3'
    'f2449a6c8b05e47367164d09036ae2302f0f28ec83c2e2f401426f52fbd4edf55f717f01eea2cbfe7554e1004b89ffdebc34ec21a95809fcbc719f69e65e8487'
    'd567f54e7cb0e53647abdb34f1faaf495eb0211602b2eaab1d25ccb3af53a80fba7dcd391240bcd57a11bf16226d808e2c389fc075f11fe57d7901a104bbac77'
    'a4966c17dfecdce153d17bc899d5565fed77b780667439d28cf5baa87897bbd04159603f28df39327f9a6661d0e2d94c72937776eb1b9f23fe2829f7a93de1ee'
    '21cb7d07e3d9680ea59b54929946c5eaa7318d5682917d1b9d44931620307550756abc9f6a17fa42bd6538bd605191cc0157a045602095b567d511e1479a4238'
    '9624a92c35ad9ab24d4b6a3ea8f5d854f12ca891f0dbc4408a16ca7a82d60921f872732b59b88ba56e73b67d1295b253d522e15656328583b9336557ce0fb335'
    '2ede5371c2e9b440252d76852a247fcf542623256b7caacffa0f655bc9cc274e7b82222c7dc74c8d878418084c947b141f79f1b073207e6d47dd60538da561be'
    '012419256f7c3f58148dd9b9ba10cc97eddd08d1d892f25bb823f7af8d430cc05a05a9fbdd586a62c1f1869b83969c601726e4a3c70ce3d7aa1a9c5a981be954'
    '907b9293cf8808812866c3b7a3e8298347da38a33996f0a2b709ea0e10926a61d5feeedae723bebcfd6854cfd290b9cca5118522aa6dabfeae3092dc1ab8791c'
)

prepare() {
    rm -rf "$_pkgname"/3rdparty/hidapi/hidapi
    ln -sf "$srcdir"/hidapi-${_hidapi_commit} "$_pkgname"/3rdparty/hidapi/hidapi
    rm -rf "$_pkgname"/llvm
    ln -sf "$srcdir"/llvm-mirror-${_llvm_commit} "$_pkgname"/llvm
    rm -rf "$_pkgname"/3rdparty/yaml-cpp/yaml-cpp
    ln -sf "$srcdir"/yaml-cpp-${_yaml_cpp_commit} "$_pkgname"/3rdparty/yaml-cpp/yaml-cpp
    rm -rf "$_pkgname"/3rdparty/xxHash
    ln -sf "$srcdir"/xxHash-${_xxHash_commit} "$_pkgname"/3rdparty/xxHash
    rm -rf "$_pkgname"/3rdparty/FAudio
    ln -sf "$srcdir"/FAudio-${_FAudio_commit} "$_pkgname"/3rdparty/FAudio
    rm -rf "$_pkgname"/3rdparty/flatbuffers
    ln -sf "$srcdir"/flatbuffers-${_flatbuffers_commit} "$_pkgname"/3rdparty/flatbuffers
    rm -rf "$_pkgname"/3rdparty/glslang/glslang
    ln -sf "$srcdir"/glslang-${_glslang_commit} "$_pkgname"/3rdparty/glslang/glslang
    rm -rf "$_pkgname"/3rdparty/SPIRV/SPIRV-Headers
    ln -sf "$srcdir"/SPIRV-Headers-${_SPIRV_Headers_commit} "$_pkgname"/3rdparty/SPIRV/SPIRV-Headers
    rm -rf "$_pkgname"/3rdparty/SPIRV/SPIRV-Tools
    ln -sf "$srcdir"/SPIRV-Tools-${_SPIRV_Tools_commit} "$_pkgname"/3rdparty/SPIRV/SPIRV-Tools
    rm -rf "$_pkgname"/3rdparty/asmjit/asmjit
    ln -sf "$srcdir"/asmjit-${_asmjit_commit} "$_pkgname"/3rdparty/asmjit/asmjit
    rm -rf "$_pkgname"/3rdparty/libusb/libusb
    ln -sf "$srcdir"/libusb-${_libusb_commit} "$_pkgname"/3rdparty/libusb/libusb
    rm -rf "$_pkgname"/3rdparty/wolfssl/wolfssl
    ln -sf "$srcdir"/wolfssl-${_wolfssl_commit} "$_pkgname"/3rdparty/wolfssl/wolfssl
    rm -rf "$_pkgname"/3rdparty/pugixml
    ln -sf "$srcdir"/pugixml-${_pugixml_commit} "$_pkgname"/3rdparty/pugixml
    rm -rf "$_pkgname"/3rdparty/cubeb/cubeb
    ln -sf "$srcdir"/cubeb-${_cubeb_commit} "$_pkgname"/3rdparty/cubeb/cubeb
}

build() {
    cmake -S "$_pkgname" -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_SKIP_RPATH=ON \
        -DUSE_NATIVE_INSTRUCTIONS=OFF \
        -DUSE_SYSTEM_FFMPEG=ON \
        -DUSE_SYSTEM_LIBPNG=ON \
        -DUSE_SYSTEM_ZLIB=ON \
        -DUSE_SYSTEM_CURL=ON
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
