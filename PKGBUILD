# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=rpcs3
pkgver=0.0.9
pkgrel=2
pkgdesc='Open-source Sony PlayStation 3 Emulator'
arch=('x86_64')
url='https://rpcs3.net/'
license=('GPL2')
depends=('ffmpeg' 'glew' 'openal' 'qt5-base' 'vulkan-icd-loader')
makedepends=('cmake' 'boost' 'spirv-tools' 'vulkan-headers')
options=('!strip')
source=("https://github.com/RPCS3/$pkgname/archive/v$pkgver.tar.gz"
    'FAudio.tar.gz::https://github.com/FNA-XNA/FAudio/archive/9c7d2d1430c9dbe4e67c871dfe003b331f165412.tar.gz'
    'cereal.tar.gz::https://github.com/USCiLab/cereal/archive/v1.2.0.tar.gz'
    'ffmpeg.tar.gz::https://github.com/RPCS3/ffmpeg-core/archive/e5fb13bbb07ac3ba2e1998e2f5688f3714870d93.tar.gz'
    'hidapi.tar.gz::https://github.com/RPCS3/hidapi/archive/9220f5e77c27b8b3717b277ec8d3121deeb50242.tar.gz'
    'libpng.tar.gz::https://github.com/RPCS3/libpng/archive/eddf9023206dc40974c26f589ee2ad63a4227a1e.tar.gz'
    'libusb.tar.gz::https://github.com/libusb/libusb/archive/v1.0.23.tar.gz'
    'pugixml.tar.gz::https://github.com/RPCS3/pugixml/archive/8bf806c035373bd0723a85c0820cfd5c804bf6cd.tar.gz'
    'span.tar.gz::https://github.com/tcbrindle/span/archive/9d7559aabdebf569cab3480a7ea2a87948c0ae47.tar.gz'
    'xxhash.tar.gz::https://github.com/Cyan4973/xxHash/archive/v0.6.5.tar.gz'
    'yaml-cpp.tar.gz::https://github.com/jbeder/yaml-cpp/archive/eca9cfd64899525d0a61abb0553849676a0fe511.tar.gz'
    'zlib.tar.gz::https://github.com/madler/zlib/archive/v1.2.11.tar.gz'
    'glslang.tar.gz::https://github.com/KhronosGroup/glslang/archive/ae59435606fc5bc453cf4e32320e6579ff7ea22e.tar.gz'
    'asmjit.tar.gz::https://github.com/kobalicek/asmjit/archive/fc251c914e77cd079e58982cdab00a47539d7fc5.tar.gz'
    'llvm.tar.gz::https://github.com/llvm-mirror/llvm/archive/1394b1ccc8cfee2846b1a38d409717e821113cf3.tar.gz'
    'git-version.h')

sha256sums=('1d5604c3b3a378f74b7c03a75db64dfab9e89c201588113d83cafb08ae12a21d'
            '02b1e07e85f578cb145a8a3dd14ce53ee0816744d71183f4b8a6090a5b194ed3'
            '1ccf3ed205a7a2f0d6a060415b123f1ae0d984cd4435db01af8de11a2eda49c1'
            '08e05c58cf2b85ef6b7077ed4f6b9bf34101f9839ee6f0c57c3bd633df2a5d70'
            'fffe45442204328bb496cf746be8586b1ac120d3f4e18531b2af04df99b603a0'
            'b1484ff1ae3711084b6dd8a880d0e560fa1c5f6d1c5a87a04a207c4bc3d315af'
            '02620708c4eea7e736240a623b0b156650c39bfa93a14bcfa5f3e05270313eba'
            'c2a717088b6377fff8c28b31f25fdf30dee78ea4b5c5261c884416fac63536b9'
            '86abe8635bdf555b948d318544b0595ef0c2e710e85f885b581f3ae08fb7e38c'
            '19030315f4fc1b4b2cdb9d7a317069a109f90e39d1fe4c9159b7aaa39030eb95'
            'e1f0a2a525cff2f82d256b967d22b9a6ce81056f6d42ae7216311d7707ea11d5'
            '629380c90a77b964d896ed37163f5c3a34f6e6d897311f1df2a7016355c45eff'
            'adbe90f86dc40a74ff2e60b041cdfa0bd408eb4c4e457241cc3c219f38d9194f'
            'fc804065cedaa0c6432df62c6effbf1c387907faf089e82794dd6d5429d6c51f'
            '74d9c432d93b087fab4c8f7d835887569fb3ca9ab6739074d05c31047e440203'
            'e9fc3c602882d75b2c8ffdf29ceaed8fd81ac8480ac36f23182022e88a989cf2')

prepare()
{
    cd "$pkgname-$pkgver"

    rmdir 3rdparty/FAudio
    ln --symbolic --force ../../FAudio-9c7d2d1430c9dbe4e67c871dfe003b331f165412 3rdparty/FAudio
    rmdir 3rdparty/cereal
    ln --symbolic --force ../../cereal-1.2.0 3rdparty/cereal
    rmdir 3rdparty/ffmpeg
    ln --symbolic --force ../../ffmpeg-core-e5fb13bbb07ac3ba2e1998e2f5688f3714870d93 3rdparty/ffmpeg
    rmdir 3rdparty/hidapi
    ln --symbolic --force ../../hidapi-9220f5e77c27b8b3717b277ec8d3121deeb50242 3rdparty/hidapi
    rmdir 3rdparty/libpng
    ln --symbolic --force ../../libpng-eddf9023206dc40974c26f589ee2ad63a4227a1e 3rdparty/libpng
    rmdir 3rdparty/libusb
    ln --symbolic --force ../../libusb-1.0.23 3rdparty/libusb
    rmdir 3rdparty/pugixml
    ln --symbolic --force ../../pugixml-8bf806c035373bd0723a85c0820cfd5c804bf6cd 3rdparty/pugixml
    rmdir 3rdparty/span
    ln --symbolic --force ../../span-9d7559aabdebf569cab3480a7ea2a87948c0ae47 3rdparty/span
    rmdir 3rdparty/xxHash
    ln --symbolic --force ../../xxHash-0.6.5 3rdparty/xxHash
    rmdir 3rdparty/yaml-cpp
    ln --symbolic --force ../../yaml-cpp-eca9cfd64899525d0a61abb0553849676a0fe511 3rdparty/yaml-cpp
    rmdir 3rdparty/zlib
    ln --symbolic --force ../../zlib-1.2.11 3rdparty/zlib
    rmdir Vulkan/glslang
    ln --symbolic --force ../../glslang-ae59435606fc5bc453cf4e32320e6579ff7ea22e Vulkan/glslang
    rmdir asmjit
    ln --symbolic --force ../asmjit-fc251c914e77cd079e58982cdab00a47539d7fc5 asmjit
    rmdir llvm
    ln --symbolic --force ../llvm-1394b1ccc8cfee2846b1a38d409717e821113cf3 llvm

    cmake . \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_EXE_LINKER_FLAGS='-ldl' \
        -DCMAKE_SKIP_RPATH='ON' \
        -DUSE_SYSTEM_FFMPEG='ON' \
        -DUSE_SYSTEM_LIBPNG='ON'

    cp ../../git-version.h rpcs3/
}

build()
{
    cd "$pkgname-$pkgver"

    make
}

package()
{
    cd "$pkgname-$pkgver"

    make DESTDIR="$pkgdir" install

    if [ -n "$pkgdir" ]
    then
        rm --force "$pkgdir/usr/bin/llvm-tblgen"
        rm --recursive --force "$pkgdir/usr/include"
        rm --recursive --force "$pkgdir/usr/lib"
    fi
}
