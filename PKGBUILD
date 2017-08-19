# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=rpcs3
pkgver=0.0.3
pkgrel=3
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
    'ffmpeg.tar.gz::https://github.com/hrydgard/ppsspp-ffmpeg/archive/8dd84dc1ea8bc70da1a345109383f62974a9c2fc.tar.gz'
    'hidapi.tar.gz::https://github.com/RPCS3/hidapi/archive/c095a22c53f13ccafc54dc59b5c882cd4036afd9.tar.gz'
    'libpng.tar.gz::https://github.com/RPCS3/libpng/archive/1dcba4d6eb1bad9500be877cbd1b0442fa92cfa6.tar.gz'
    'pugixml.tar.gz::https://github.com/RPCS3/pugixml/archive/f205aaf6e1c90f1dda943edd4f82922118a85648.tar.gz'
    'zlib.tar.gz::https://github.com/madler/zlib/archive/v1.2.11.tar.gz'
    'Vulkan-LoaderAndValidationLayers.tar.gz::https://github.com/KhronosGroup/Vulkan-LoaderAndValidationLayers/archive/115665a3b59059b9706e0afed6ce348bd58b1c38.tar.gz'
    'glslang.tar.gz::https://github.com/KhronosGroup/glslang/archive/0e07119ae295b5624006518a9046c3fcd16087e2.tar.gz'
    'asmjit.tar.gz::https://github.com/kobalicek/asmjit/archive/1370fe6a26a82f18500faedac66798953961a916.tar.gz'
    'llvm.tar.gz::https://github.com/llvm-mirror/llvm/archive/4423e351176a92975739dd4ea43c2ff5877236ae.tar.gz'
    'rsx-debugger.tar.gz::https://github.com/RPCS3/rsx-debugger/archive/3b11b9652d5b47792521495d9e4bc8343ac3e1d3.tar.gz')

sha256sums=('cf92c7fbf38a4986adf50927637f572fbb669da90177d88819e42bb5a95bbce1'
            '0699d2fbfff96f09b170c5d5d93a7d782bf028a4fbe3c7cc9c5edfedf1124b2d'
            '1ccf3ed205a7a2f0d6a060415b123f1ae0d984cd4435db01af8de11a2eda49c1'
            'f116908aaee7c6334b91b828833eb0fbfdf59894e6331ebe9a063ff4d5e2af56'
            '32855f9b39e596da3ad0953d27357d29a81d3b64569ab38404623fb43b70d6cb'
            'c8fbec2f447b2e09b68b6970ee8c3e5cdd5775aff9ec1e2db6ed5f06fc273312'
            '5e4c4a76061ef0917372ad80dfbd477e676a263595f4a15e5456ac849ec3832d'
            '629380c90a77b964d896ed37163f5c3a34f6e6d897311f1df2a7016355c45eff'
            '566ce432e3542c24615b17f3aaa1836bf55719e7c50a9653151367874e07247c'
            '392008129055d8bc4b421bb7135d11e92109ee2d01dd76339d1df4ff883b9d6e'
            'e4ec96d7dd8d90e7e448b6f034b3a812865435b1e795893a35526002e722ce6a'
            'a537ebf611e8924e44ffba544e67c0e39b1fc5fdd048f2bc074625bb449c6e90'
            'a3ec4a36f0eb6de76bb24c57f926e784274e29decc35c546ee9629b7d5cb7c07')

prepare()
{
    cd "$pkgname-$pkgver"

    rmdir 3rdparty/GSL
    ln --symbolic --force ../../GSL-fc5fce4f4f8d64fbda523d1b0d55115f5ca68774/ 3rdparty/GSL
    rmdir 3rdparty/cereal
    ln --symbolic --force ../../cereal-1.2.0 3rdparty/cereal
    rmdir 3rdparty/ffmpeg
    ln --symbolic --force ../../ppsspp-ffmpeg-8dd84dc1ea8bc70da1a345109383f62974a9c2fc 3rdparty/ffmpeg
    rmdir 3rdparty/hidapi
    ln --symbolic --force ../../hidapi-c095a22c53f13ccafc54dc59b5c882cd4036afd9 3rdparty/hidapi
    rmdir 3rdparty/libpng
    ln --symbolic --force ../../libpng-1dcba4d6eb1bad9500be877cbd1b0442fa92cfa6 3rdparty/libpng
    rmdir 3rdparty/pugixml
    ln --symbolic --force ../../pugixml-f205aaf6e1c90f1dda943edd4f82922118a85648 3rdparty/pugixml
    rmdir 3rdparty/zlib
    ln --symbolic --force ../../zlib-1.2.11 3rdparty/zlib
    rmdir Vulkan/Vulkan-LoaderAndValidationLayers
    ln --symbolic --force ../../Vulkan-LoaderAndValidationLayers-115665a3b59059b9706e0afed6ce348bd58b1c38 Vulkan/Vulkan-LoaderAndValidationLayers
    rmdir Vulkan/glslang
    ln --symbolic --force ../../glslang-0e07119ae295b5624006518a9046c3fcd16087e2 Vulkan/glslang
    rmdir asmjit
    ln --symbolic --force ../asmjit-1370fe6a26a82f18500faedac66798953961a916 asmjit
    rmdir llvm
    ln --symbolic --force ../llvm-4423e351176a92975739dd4ea43c2ff5877236ae llvm
    rmdir rsx-debugger
    ln --symbolic --force ../rsx-debugger-3b11b9652d5b47792521495d9e4bc8343ac3e1d3 rsx-debugger

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
