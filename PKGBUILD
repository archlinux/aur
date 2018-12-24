# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=rpcs3
pkgver=0.0.5
pkgrel=7
pkgdesc='Open-source Sony PlayStation 3 Emulator'
arch=('x86_64')
url='https://rpcs3.net/'
license=('GPL2')
depends=('ffmpeg' 'glew' 'openal' 'qt5-base' 'vulkan-icd-loader' 'yaml-cpp')
makedepends=('cmake' 'boost')
options=('!strip')
source=("https://github.com/RPCS3/$pkgname/archive/v$pkgver.tar.gz"
    'GSL.tar.gz::https://github.com/Microsoft/GSL/archive/fc5fce4f4f8d64fbda523d1b0d55115f5ca68774.tar.gz'
    'cereal.tar.gz::https://github.com/USCiLab/cereal/archive/v1.2.0.tar.gz'
    'ffmpeg.tar.gz::https://github.com/hrydgard/ppsspp-ffmpeg/archive/7b7ae7b06705bf5539b222e77c779d4b649b53ef.tar.gz'
    'hidapi.tar.gz::https://github.com/RPCS3/hidapi/archive/ca39ce8939e490ffcadb38ff978447aac1c17662.tar.gz'
    'libpng.tar.gz::https://github.com/RPCS3/libpng/archive/1dcba4d6eb1bad9500be877cbd1b0442fa92cfa6.tar.gz'
    'pugixml.tar.gz::https://github.com/RPCS3/pugixml/archive/257fbb4e1b09b0f1a6b2020ae2db190b87c8f9c7.tar.gz'
    'zlib.tar.gz::https://github.com/madler/zlib/archive/v1.2.11.tar.gz'
    'Vulkan-LoaderAndValidationLayers.tar.gz::https://github.com/KhronosGroup/Vulkan-LoaderAndValidationLayers/archive/28d93dfc0f24d65237fd773d74a284bf6e399222.tar.gz'
    'glslang.tar.gz::https://github.com/KhronosGroup/glslang/archive/e22e3473958e9bf3536f6c2133d66e5808816b78.tar.gz'
    'asmjit.tar.gz::https://github.com/kobalicek/asmjit/archive/673dcefaa048c5f5a2bf8b85daf8f7b9978d018a.tar.gz'
    'llvm.tar.gz::https://github.com/llvm-mirror/llvm/archive/4423e351176a92975739dd4ea43c2ff5877236ae.tar.gz'
    'optional.tar.gz::https://github.com/akrzemi1/Optional/archive/f27e79084a9176672ed1eae50b3397fa8035d50d.tar.gz'
    'git-version.h'
    'rpcs3.patch')

sha256sums=('a33a208076e7bc31e2a4023a270e4769c1ae13463fe16a4fcbe3ad7915fba7b0'
            '0699d2fbfff96f09b170c5d5d93a7d782bf028a4fbe3c7cc9c5edfedf1124b2d'
            '1ccf3ed205a7a2f0d6a060415b123f1ae0d984cd4435db01af8de11a2eda49c1'
            '1596acf40444d17e17ef574b9ad8c7f2de9cbc429273da0b90883bffdb493071'
            '408e65ce23481bdb289f01930602afc36c238e41ffcc7e4915fb8457799c24bb'
            'c8fbec2f447b2e09b68b6970ee8c3e5cdd5775aff9ec1e2db6ed5f06fc273312'
            'b5a1f24be920f86c76503a1e856da5b86fdeb98b5a4e3f30c929af9c5fdc0d6c'
            '629380c90a77b964d896ed37163f5c3a34f6e6d897311f1df2a7016355c45eff'
            '24417e030a734557b2e424d2446602c8efe5e8cc306e7da68fb3812d125e5afc'
            'dbb08ec1a3d73c997fe5226320192aaf0cf881412e0956a3bd9aefd7881c3e76'
            '9c59802895a7812d6ce63f25abf9ad75fe651ab7b550d79cd266fee34bfedfeb'
            '16dc99ccbe614bba047f35f4338a23fc0f9e071d4fcca65dc4fd211ecf2a7254'
            '0e7fc73bf95be5a8fe92373c68dab07b09646fba7d9b76eb047a1b665f4e45c6'
            '4602a47515c0a976da699931358a25e9b9f3c953d2abff9c862c6be9ba2708a6'
            '70bfa22539a9c5aa85ae4e23a9be7e933897d187518c5c20e35ec8938d517585')

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
    ln --symbolic --force ../../pugixml-257fbb4e1b09b0f1a6b2020ae2db190b87c8f9c7 3rdparty/pugixml
    rmdir 3rdparty/zlib
    ln --symbolic --force ../../zlib-1.2.11 3rdparty/zlib
    rmdir Vulkan/Vulkan-LoaderAndValidationLayers
    ln --symbolic --force ../../Vulkan-LoaderAndValidationLayers-28d93dfc0f24d65237fd773d74a284bf6e399222 Vulkan/Vulkan-LoaderAndValidationLayers
    rmdir Vulkan/glslang
    ln --symbolic --force ../../glslang-e22e3473958e9bf3536f6c2133d66e5808816b78 Vulkan/glslang
    rmdir asmjit
    ln --symbolic --force ../asmjit-673dcefaa048c5f5a2bf8b85daf8f7b9978d018a asmjit
    rmdir llvm
    ln --symbolic --force ../llvm-4423e351176a92975739dd4ea43c2ff5877236ae llvm

    if [ ! -d build ]
    then
        mkdir build
    fi

    patch -Np1 -i "${srcdir}/rpcs3.patch"

    cd build

    cmake .. \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_EXE_LINKER_FLAGS='-ldl -lyaml-cpp' \
        -DCMAKE_SKIP_RPATH='ON' \
        -DUSE_SYSTEM_FFMPEG='ON' \
        -DUSE_SYSTEM_LIBPNG='ON'

    cp ../../git-version.h ../rpcs3/
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

    if [ -n "$pkgdir" ]
    then
        rm --force "$pkgdir/usr/bin/llvm-tblgen"
        rm --recursive --force "$pkgdir/usr/include"
        rm --recursive --force "$pkgdir/usr/lib"
    fi
}
