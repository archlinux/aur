# Maintainer: Sébastien TERRIER <ouinouin at ouinouin dot eu>
pkgname=citron
pkgver=0.6.1
pkgrel=6
pkgdesc="Nintendo Switch emulator forked from yuzu."
arch=(x86_64)
url=https://citron-emu.org
license=(GPL-2.0-or-later)
provides=('citron')
depends=('qt6-base' 'qt6-webengine' 'qt6-multimedia' 'qt6-wayland' 'qt6-tools' 'fmt' 'boost-libs' 'ffmpeg' 'sdl2' 'gamemode' 'hicolor-icon-theme' 'brotli' 'libusb' 'enet' 'opus')
makedepends=('curl' 'git' 'cmake' 'clang' 'boost' 'python-pip' 'glslang' 'ninja' 'zip' 'unzip' 'libzip' 'nlohmann-json' 'zlib' 'zstd' 'rapidjson')
conflicts=('citron')
options=(!debug)
_tag="v${pkgver}-canary-refresh"
source=(${pkgname}::git+https://git.citron-emu.org/citron/emu.git#tag=${_tag}
        cubeb::git+https://github.com/mozilla/cubeb.git#commit=48689ae7a73caeb747953f9ed664dc71d2f918d8
        discord-rpc::git+https://github.com/yuzu-mirror/discord-rpc.git#commit=20cc99aeffa08a4834f156b6ab49ed68618cf94a
        dynarmic::git+https://github.com/yuzu-mirror/dynarmic.git#commit=ba8192d89078af51ae6f97c9352e3683612cdff1
        Vulkan-Headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git#commit=cacef3039d277c448c89336290ec3937270b0996
        sirit::git+https://github.com/yuzu-mirror/sirit.git#commit=ab75463999f4f3291976b079d42d52ee91eebf3f
        mbedtls::git+https://github.com/yuzu-mirror/mbedtls.git#commit=8c88150ca139e06aa2aae8349df8292a88148ea1
        xbyak::git+https://github.com/herumi/xbyak.git#commit=a1ac3750f9a639b5a6c6d6c7da4259b8d6790989
        cpp-httplib::git+https://github.com/yhirose/cpp-httplib.git#commit=39a64fb4e7e42216f14f0ec51ccc5fa85e651432
        cpp-jwt::git+https://github.com/arun11299/cpp-jwt.git#commit=4a970bc302d671476122cbc6b43cc89fbf4a96ec
        libadrenotools::git+https://github.com/bylaws/libadrenotools.git#commit=8fae8ce254dfc1344527e05301e43f37dea2df80
        tzdb_to_nx::git+https://github.com/lat9nq/tzdb_to_nx.git#commit=97929690234f2b4add36b33657fe3fe09bd57dfd
        VulkanMemoryAllocator::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git#commit=c788c52156f3ef7bc7ab769cb03c110a53ac8fcb
        breakpad::git+https://github.com/yuzu-mirror/breakpad.git#commit=c89f9dddc793f19910ef06c13e4fd240da4e7a59
        simpleini::git+https://github.com/brofield/simpleini.git#commit=6048871ea9ee0ec24be5bd099d161a10567d7dc2
        oaknut::git+https://github.com/yuzu-mirror/oaknut.git#commit=94c726ce0338b054eb8cb5ea91de8fe6c19f4392
        Vulkan-Utility-Libraries::git+https://github.com/KhronosGroup/Vulkan-Utility-Libraries.git#commit=bc3a4d9fd9b46729651a3cec4f5226f6272b8684
        googletest::git+https://github.com/google/googletest.git#commit=800f5422ac9d9e0ad59cd860a2ef3a679588acb4
        sanitizers-cmake::git+https://github.com/arsenm/sanitizers-cmake.git#commit=aab6948fa863bc1cbe5d0850bc46b9ef02ed4c1a
        zycore::git+https://github.com/zyantific/zycore-c.git#commit=0c372cdefe799e99812c008a0b74537bfa5fe077
        linkernsbypass::git+https://github.com/bylaws/liblinkernsbypass.git#commit=aa3975893d83ef1bc84c321ec60c65fbf1287887
        tz::git+https://github.com/eggert/tz.git#commit=16ce126a87c5f130cde8b8dce73b38952a19f085
        SPIRV-Headers::git+https://github.com/KhronosGroup/SPIRV-Headers.git#commit=c214f6f2d1a7253bb0e9f195c2dc5b0659dc99ef)

b2sums=('019d48f467e59abdc56214794daf650c9a6985cf5c42f71ae14b2d66a80861aea069a16e2e6707692e15d50fea12360b81303fb4c7bdf8a6f644b99bfcf239f4'
        '289728aefb4c64d64dfc4c2a62ae4b5c3cb346bbb304785ba7701c239ec2ef7c00d56c37c3b81384bdac94ac7e6334a4f42c34901ff4c1dff310ac8f7c46d539'
        '952a9c808c567f75cc4b93fe8f37ff8910f6016eb16645398b9dd366d770c3a573d21297abe066456608e45eb33cf89ad41b079798756d403b1887c66a28dc7d'
        '01942df0d991c75f716a524bb81bb75f7ddeeb5ae0215915e40d5d90bb53bf0a34c5bab7368e4936c859f2e08b687864d93f25dcd01da1d70fa69b890c1deaf8'
        '1c5899b459bf936250eed654e61bc108b3853e1847764a5a74176444ccebbb6e7a383ddac42ee3b2dc27f74e3a375f7c0360ab70585d3a2bf0602fee324b8db7'
        '91e4cd03d67c930b6d751ca19cf6fbaaba86084412bd13b172186387ea27b461457a3e19bc0af315c807839e64f91c865298678af748e2d6e07df2abc85430ed'
        '6198d4eea1f6618d4bed5fc3e6103245d42080a1b7a327ae566c6cae609fde64819c8b67284ec6a79ad42afb1c07bb809411f9277ea3e03325ef1ddfa181c2d1'
        '10564f981204fe52c4c737a5c98ff4431e156ea0936355ee999656b7564329531fe832dfbf742642c33fbb86ab95b2a082dcd9415ef91b9089e282f535f10057'
        '2100f8742345fe7f40b5366107431ba2fbf17986b511e7b8350346e6960a36bd19a6fa56a6fab40166c953e851259ed6a7adbcba5a7bbefab46ccdf3c192a770'
        'bece1c4e58c067a4d45ef7b3c6d225f082e49c9c082b3f4a6096629dd5930a4dedd4da629bba2c703183c2ec1c0820d9f2229ae1e96e2aa8efa6a2ed08c568dd'
        '4f90e3fc9af0a11f12e52ba97ceb2422f123d7c5612500c8d2784a423899b8e951100e58ac2e89e20b57182f7ee7d8f7c9240e8d1c32f2732f11d3a75fd53297'
        '03f29026e30be85bdd64331f29538baa9e88731192b5a8b944703c42d43335d42fd9ee7574a3d2dc1856a9f19133feaf4ce1d4e66df6c80005d724e6a152cc31'
        'aca4f69aed630852f3aec4bdd4b6fd35935cc896c682e1b1d660bce0da54b40617889fa4a9ae788d49472be5bd12f9bf609f7a7a74ce5139ce904b8c8bd39976'
        '53f06a264cbaf9bea11dcc8592ed159663a0c236dff1e9c7ea8f679f605cd14c5bfd262367103e56ef7527df5b526f6c4e9b25415e057603bb16c0741a5811dc'
        'fae42bb13f180ab991f6bfc8a45ea3df08ced1d77db77f54cf5a222f93ea468bd6fc0d36d65f9f3739e9813d77dbae31931948dc9afa28e884c53b8128c13c94'
        'a7eebd683a4af5636869667d5b888aa5351b4d5f2d14c632be3b856bbe84b016aae271350e2f5db1229feb5a1b8e56f2c09282dfdf2347a4316c5e147d87669e'
        '02cb2bc828f5cb28b74490cdd47b7f685cf0a2e9323d4be18565d5f8c488a1be646f915fa320258c50e0d968b36829e2c47531545ad558c93f942b6c62569f64'
        '2efd2e39903880e9265f380f93dd6407b052e53225373ec48761a8c7501a996f5a365d2e936af7ffcc097812c5694459272a22ff1c691571f252688de4bf8120'
        '59ca30552e153a8fdc2804878095f06946e4d4ea9c273f4f100dfee1f74990031a0db0d20c8478c4a6a1d21e6d808addd6aea727a161bf2ea3834b1fb436e18c'
        '1206839fbf7b665252d4990bd97b528f63fb92719768e259d36c598cb3120c1a2cb8b56ad4a7350ecc1b36f26481b9ff61e5cb611858ed514e0879ff5ac8353b'
        '144e770a4b09870231fec5819b5093c83d06e5e1350cec8664b2d0bbf55d224559cb132234cdd3510b476844938eba49fc971261f4c4f14a4af91ed3abb97134'
        '89b435c74955121f0880be33fc459c8f1f38b8b5e51eb01c6b559e650a68406eea2396b4a9ff9eaf6567dda67ec5fb1ac049488af6e5a8abbbb3494d5a3a0036'
        '686239a1a777acde8e9ac22bf338dec5d553e6846919cfd8f907693774f335a44632c13dbbb5d1cdaba968c67edd88f20ec6dc4ee2d289a5f5149bf04bf4dad6')

prepare() {
  cd "$srcdir/$pkgname"
  git rm -f externals/SDL
  git rm -f externals/ffmpeg/ffmpeg
  git rm -f externals/enet
  git rm -f externals/opus
  git rm -f externals/vcpkg
  git rm -f externals/libusb/libusb

  for _submodule in cubeb discord-rpc dynarmic Vulkan-Headers sirit mbedtls xbyak cpp-httplib cpp-jwt libadrenotools tzdb_to_nx VulkanMemoryAllocator breakpad simpleini oaknut Vulkan-Utility-Libraries;
    do
      git config submodule.$_submodule.url "${srcdir}/$_submodule"
    done
  git -c protocol.file.allow=always submodule update

  pushd externals/cubeb
    git config submodule.cmake/sanitizers-cmake.url "${srcdir}"/sanitizers-cmake
    git config submodule.googletest.url "${srcdir}"/googletest
    git -c protocol.file.allow=always submodule update
  popd

  pushd externals/dynarmic/externals/zydis
    git config submodule.dependencies/zycore.url "${srcdir}"/zycore
    git -c protocol.file.allow=always submodule update
  popd

  pushd externals/libadrenotools
    git config submodule.lib/linkernsbypass.url "${srcdir}"/linkernsbypass
    git -c protocol.file.allow=always submodule update
  popd

  pushd externals/nx_tzdb/tzdb_to_nx
    git config submodule.externals/tz/tz.url "${srcdir}"/tz
    git -c protocol.file.allow=always submodule update
  popd

  pushd externals/sirit
    git config submodule.externals/SPIRV-Headers.url "${srcdir}"/SPIRV-Headers
    git -c protocol.file.allow=always submodule update
  popd
  
  #Replaces 'boost::asio::io_service' with 'boost::asio::io_context' for compatibility with Boost.ASIO versions 1.74.0 and later
  find src -type f -name '*.cpp' -exec sed -i 's/boost::asio::io_service/boost::asio::io_context/g' {} +
  
  # Correct deprecated Boost include
  sed -i 's/#include <boost\/process\/async_pipe\.hpp>/#include <boost\/process\/v1\/async_pipe\.hpp>/g' src/core/debugger/debugger.cpp
}

build() {
  cd "$srcdir/$pkgname"
  cmake -B build -GNinja \
    -DCITRON_USE_BUNDLED_VCPKG=OFF \
    -DCITRON_USE_BUNDLED_QT=OFF \
    -DUSE_SYSTEM_QT=ON \
    -DCITRON_USE_BUNDLED_FFMPEG=OFF \
    -DCITRON_USE_BUNDLED_SDL2=OFF \
    -DCITRON_USE_EXTERNAL_SDL2=OFF \
    -DCITRON_TESTS=OFF \
    -DCITRON_CHECK_SUBMODULES=OFF \
    -DCITRON_USE_LLVM_DEMANGLE=OFF \
    -DCITRON_ENABLE_LTO=ON \
    -DCITRON_USE_QT_MULTIMEDIA=ON \
    -DCITRON_USE_QT_WEB_ENGINE=ON \
    -DENABLE_QT_TRANSLATION=ON \
    -DUSE_DISCORD_PRESENCE=ON \
    -DBUNDLE_SPEEX=ON \
    -DCITRON_USE_FASTER_LD=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS" \
    -DCMAKE_C_FLAGS="$CFLAGS" \
    -DCMAKE_SYSTEM_PROCESSOR=x86_64 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    
  ninja -C build
}

package() {
  DESTDIR="$pkgdir/" ninja -C "$srcdir/$pkgname"/build install
}
