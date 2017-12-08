# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=rpcs3
pkgver=0.0.4
pkgrel=2
pkgdesc='Open-source Sony PlayStation 3 Emulator'
arch=('x86_64')
url='https://rpcs3.net/'
license=('GPL2')
depends=('alsa-lib' 'glew1.13' 'hicolor-icon-theme' 'libudev.so'
    'ncurses5-compat-libs' 'openal' 'qt5-base' 'vulkan-icd-loader' 'yaml-cpp')
makedepends=('cmake')
options=('!strip')
source=("https://github.com/RPCS3/$pkgname/archive/v$pkgver.tar.gz"
    'GSL.tar.gz::https://github.com/Microsoft/GSL/archive/fc5fce4f4f8d64fbda523d1b0d55115f5ca68774.tar.gz'
    'cereal.tar.gz::https://github.com/USCiLab/cereal/archive/v1.2.0.tar.gz'
    'ffmpeg.tar.gz::https://github.com/hrydgard/ppsspp-ffmpeg/archive/7b7ae7b06705bf5539b222e77c779d4b649b53ef.tar.gz'
    'hidapi.tar.gz::https://github.com/RPCS3/hidapi/archive/ca39ce8939e490ffcadb38ff978447aac1c17662.tar.gz'
    'libpng.tar.gz::https://github.com/RPCS3/libpng/archive/1dcba4d6eb1bad9500be877cbd1b0442fa92cfa6.tar.gz'
    'pugixml.tar.gz::https://github.com/RPCS3/pugixml/archive/f205aaf6e1c90f1dda943edd4f82922118a85648.tar.gz'
    'zlib.tar.gz::https://github.com/madler/zlib/archive/v1.2.11.tar.gz'
    'Vulkan-LoaderAndValidationLayers.tar.gz::https://github.com/KhronosGroup/Vulkan-LoaderAndValidationLayers/archive/85926a33d427ee62f395a50886db980127063c72.tar.gz'
    'glslang.tar.gz::https://github.com/KhronosGroup/glslang/archive/cf571f7310f58e6eb4ea35600ef1401bc76db0d2.tar.gz'
    'asmjit.tar.gz::https://github.com/kobalicek/asmjit/archive/1370fe6a26a82f18500faedac66798953961a916.tar.gz'
    'llvm.tar.gz::https://github.com/llvm-mirror/llvm/archive/4423e351176a92975739dd4ea43c2ff5877236ae.tar.gz'
    'optional.tar.gz::https://github.com/akrzemi1/Optional/archive/f27e79084a9176672ed1eae50b3397fa8035d50d.tar.gz'
    'git-version.h')

sha256sums=('fad33644c99db5f7582140052b604ae842de3b80fd9428156ef0fbeaaf431763'
            '0699d2fbfff96f09b170c5d5d93a7d782bf028a4fbe3c7cc9c5edfedf1124b2d'
            '1ccf3ed205a7a2f0d6a060415b123f1ae0d984cd4435db01af8de11a2eda49c1'
            '1596acf40444d17e17ef574b9ad8c7f2de9cbc429273da0b90883bffdb493071'
            '408e65ce23481bdb289f01930602afc36c238e41ffcc7e4915fb8457799c24bb'
            'c8fbec2f447b2e09b68b6970ee8c3e5cdd5775aff9ec1e2db6ed5f06fc273312'
            '5e4c4a76061ef0917372ad80dfbd477e676a263595f4a15e5456ac849ec3832d'
            '629380c90a77b964d896ed37163f5c3a34f6e6d897311f1df2a7016355c45eff'
            '52067f486c8650a0e1a4a18ef691563433f680889c539b2c6555481798a8f5e4'
            '482c46287ea534c6f8bb346f91fc26199997d832cff4ae6dab0c9d6bb8307608'
            'e4ec96d7dd8d90e7e448b6f034b3a812865435b1e795893a35526002e722ce6a'
            '16dc99ccbe614bba047f35f4338a23fc0f9e071d4fcca65dc4fd211ecf2a7254'
            '0e7fc73bf95be5a8fe92373c68dab07b09646fba7d9b76eb047a1b665f4e45c6'
            '4602a47515c0a976da699931358a25e9b9f3c953d2abff9c862c6be9ba2708a6')

prepare()
{
    cd "$pkgname-$pkgver"

    rmdir 3rdparty/GSL
    ln --symbolic --force ../../GSL-fc5fce4f4f8d64fbda523d1b0d55115f5ca68774/ 3rdparty/GSL
    rmdir 3rdparty/cereal
    ln --symbolic --force ../../cereal-1.2.0 3rdparty/cereal
    rmdir 3rdparty/ffmpeg
    ln --symbolic --force ../../ppsspp-ffmpeg-7b7ae7b06705bf5539b222e77c779d4b649b53ef 3rdparty/ffmpeg
    rmdir 3rdparty/hidapi
    ln --symbolic --force ../../hidapi-ca39ce8939e490ffcadb38ff978447aac1c17662 3rdparty/hidapi
    rmdir 3rdparty/libpng
    ln --symbolic --force ../../libpng-1dcba4d6eb1bad9500be877cbd1b0442fa92cfa6 3rdparty/libpng
    rmdir 3rdparty/Optional
    ln --symbolic --force ../../Optional-f27e79084a9176672ed1eae50b3397fa8035d50d 3rdparty/Optional
    rmdir 3rdparty/pugixml
    ln --symbolic --force ../../pugixml-f205aaf6e1c90f1dda943edd4f82922118a85648 3rdparty/pugixml
    rmdir 3rdparty/zlib
    ln --symbolic --force ../../zlib-1.2.11 3rdparty/zlib
    rmdir Vulkan/Vulkan-LoaderAndValidationLayers
    ln --symbolic --force ../../Vulkan-LoaderAndValidationLayers-85926a33d427ee62f395a50886db980127063c72 Vulkan/Vulkan-LoaderAndValidationLayers
    rmdir Vulkan/glslang
    ln --symbolic --force ../../glslang-cf571f7310f58e6eb4ea35600ef1401bc76db0d2 Vulkan/glslang
    rmdir asmjit
    ln --symbolic --force ../asmjit-1370fe6a26a82f18500faedac66798953961a916 asmjit
    rmdir llvm
    ln --symbolic --force ../llvm-4423e351176a92975739dd4ea43c2ff5877236ae llvm

    if [ ! -d build ]
    then
        mkdir build
    fi

    cd build

    cmake .. \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_EXE_LINKER_FLAGS='-ldl -lyaml-cpp' \
        -DCMAKE_SKIP_RPATH='ON' \
        -DUSE_SYSTEM_FFMPEG='ON' \
        -DUSE_SYSTEM_LIBPNG='ON'

    cp ../../../git-version.h ../rpcs3/
}

build()
{
    cd "$pkgname-$pkgver/build"

    make
}

package()
{
    cd "$pkgname-$pkgver/build"

    make DESTDIR="$pkgdir" install
}
