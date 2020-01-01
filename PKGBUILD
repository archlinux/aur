# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=rpcs3
pkgver=0.0.8
pkgrel=1
pkgdesc='Open-source Sony PlayStation 3 Emulator'
arch=('x86_64')
url='https://rpcs3.net/'
license=('GPL2')
depends=('ffmpeg' 'glew' 'openal' 'qt5-base' 'vulkan-icd-loader')
makedepends=('cmake' 'boost')
options=('!strip')
source=("https://github.com/RPCS3/$pkgname/archive/v$pkgver.tar.gz"
    'FAudio.tar.gz::https://github.com/FNA-XNA/FAudio/archive/19.10.tar.gz'
    'cereal.tar.gz::https://github.com/USCiLab/cereal/archive/v1.2.0.tar.gz'
    'ffmpeg.tar.gz::https://github.com/hrydgard/ppsspp-ffmpeg/archive/7b7ae7b06705bf5539b222e77c779d4b649b53ef.tar.gz'
    'hidapi.tar.gz::https://github.com/RPCS3/hidapi/archive/9220f5e77c27b8b3717b277ec8d3121deeb50242.tar.gz'
    'libpng.tar.gz::https://github.com/RPCS3/libpng/archive/eddf9023206dc40974c26f589ee2ad63a4227a1e.tar.gz'
    'libusb.tar.gz::https://github.com/RPCS3/libusb/archive/7cfa00e9d723f10167b4d71bceebf2b4b2cbd70e.tar.gz'
    'pugixml.tar.gz::https://github.com/RPCS3/pugixml/archive/8bf806c035373bd0723a85c0820cfd5c804bf6cd.tar.gz'
    'span.tar.gz::https://github.com/tcbrindle/span/archive/9d7559aabdebf569cab3480a7ea2a87948c0ae47.tar.gz'
    'xxhash.tar.gz::https://github.com/Cyan4973/xxHash/archive/v0.6.5.tar.gz'
    'yaml-cpp.tar.gz::https://github.com/jbeder/yaml-cpp/archive/eca9cfd64899525d0a61abb0553849676a0fe511.tar.gz'
    'zlib.tar.gz::https://github.com/madler/zlib/archive/v1.2.11.tar.gz'
    'glslang.tar.gz::https://github.com/KhronosGroup/glslang/archive/7.13.3496.tar.gz'
    'asmjit.tar.gz::https://github.com/kobalicek/asmjit/archive/fc251c914e77cd079e58982cdab00a47539d7fc5.tar.gz'
    'llvm.tar.gz::https://github.com/llvm-mirror/llvm/archive/2e038bff1082175b510a2e8336edf897af9b87a3.tar.gz'
    'git-version.h')

sha256sums=('19287a3d6914063042b3ab9e81b7d2985a4c68c86b903921f47a25a63a329863'
            '98bc55b494ac5249a4eed13b77394fa30bd9dac0931d4364616d2e501d987457'
            '1ccf3ed205a7a2f0d6a060415b123f1ae0d984cd4435db01af8de11a2eda49c1'
            '1596acf40444d17e17ef574b9ad8c7f2de9cbc429273da0b90883bffdb493071'
            'fffe45442204328bb496cf746be8586b1ac120d3f4e18531b2af04df99b603a0'
            'b1484ff1ae3711084b6dd8a880d0e560fa1c5f6d1c5a87a04a207c4bc3d315af'
            '6fb6de602be1ca9e15be826378c326dcc219b91ce8f41f522f70b86021bff62b'
            'c2a717088b6377fff8c28b31f25fdf30dee78ea4b5c5261c884416fac63536b9'
            '86abe8635bdf555b948d318544b0595ef0c2e710e85f885b581f3ae08fb7e38c'
            '19030315f4fc1b4b2cdb9d7a317069a109f90e39d1fe4c9159b7aaa39030eb95'
            'e1f0a2a525cff2f82d256b967d22b9a6ce81056f6d42ae7216311d7707ea11d5'
            '629380c90a77b964d896ed37163f5c3a34f6e6d897311f1df2a7016355c45eff'
            '170d1538a670af4cae300e875d7cda9744b1acee1ab7252ecf7c4004186bb922'
            'fc804065cedaa0c6432df62c6effbf1c387907faf089e82794dd6d5429d6c51f'
            '58f9824c5cd1edc769ec01f68097a86ec6a202de68635ac3ecd4f9ccb8a4fa4b'
            'aeef36748af56073bb4e1d419df4a5bd87954c21027426d295411d60c8ba0678')

prepare()
{
    cd "$pkgname-$pkgver"

    rmdir 3rdparty/FAudio
    ln --symbolic --force ../../FAudio-19.10 3rdparty/FAudio
    rmdir 3rdparty/cereal
    ln --symbolic --force ../../cereal-1.2.0 3rdparty/cereal
    rmdir 3rdparty/ffmpeg
    ln --symbolic --force ../../ppsspp-ffmpeg-7b7ae7b06705bf5539b222e77c779d4b649b53ef 3rdparty/ffmpeg
    rmdir 3rdparty/hidapi
    ln --symbolic --force ../../hidapi-9220f5e77c27b8b3717b277ec8d3121deeb50242 3rdparty/hidapi
    rmdir 3rdparty/libpng
    ln --symbolic --force ../../libpng-eddf9023206dc40974c26f589ee2ad63a4227a1e 3rdparty/libpng
    rmdir 3rdparty/libusb
    ln --symbolic --force ../../libusb-7cfa00e9d723f10167b4d71bceebf2b4b2cbd70e 3rdparty/libusb
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
    ln --symbolic --force ../../glslang-7.13.3496 Vulkan/glslang
    rmdir asmjit
    ln --symbolic --force ../asmjit-fc251c914e77cd079e58982cdab00a47539d7fc5 asmjit
    rmdir llvm
    ln --symbolic --force ../llvm-2e038bff1082175b510a2e8336edf897af9b87a3 llvm

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
