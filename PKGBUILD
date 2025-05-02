# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Christopher Snowhill <kode54@gmail.com>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Sanpi <sanpi+aur@homecomputing.fr>

pkgname="rpcs3"
pkgver=0.0.36
pkgrel=4
pkgdesc="An open-source PlayStation 3 emulator/debugger written in C++"
arch=('aarch64' 'x86_64')
url="https://rpcs3.net"
_url="https://github.com/RPCS3/${pkgname}"
license=('GPL-2.0-only')
depends=('alsa-lib' 'curl' 'faudio' 'ffmpeg' 'flatbuffers>=2' 'gcc-libs' 'glew'
         'glibc' 'glu' 'hicolor-icon-theme' 'libevdev' 'libgl' 'libice'
         'libpng' 'libpulse' 'libsm' 'libusb>=1' 'libx11' 'libxext' 'llvm-libs'
         'openal' 'opencv' 'pugixml>=1.15' 'qt6-base' 'qt6-declarative'
         'qt6-multimedia' 'qt6-svg' 'sdl3' 'systemd-libs' 'vulkan-icd-loader'
         'zlib') # 'wolfssl>=4.7'
makedepends=('clang' 'cmake>=3.28' 'lld' 'llvm' 'vulkan-headers')
optdepends=('vulkan-validation-layers'
            'rpcs3-udev: support DualShock 3, 4 and DualSense controllers')
options=('!lto' '!strip')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}_qt690_atomic.patch" # ::${_url}/commit/600e4604169464c64cbf548e7629e483ad2aad1e.patch?full_index=1"
        "${pkgname}_qt690_setDefaultSectionSize.patch::${_url}/commit/9c5b3a2300b3ac44b897813ebc1cb0949c3b3e6d.patch?full_index=1"
        "${pkgname}_gcc15_cstdint.patch")
b2sums=('7b1cfb7ee71ccdf54a60a440d2fa7e8966af4e9d39623423021c3d6b8ea9b2b0a406028e35bb45147df90c3ed5bbdadae4fef234246384640d9c391a69efb0d4'
        '68f9e3283f5194e56449441d45b83b47863db4eaea3586aaa73f37a1c8328495a1e4e64398698cbf3059ecc4d17295a192c79596eca7b595f7f1bc5921dc568c'
        '8f837d3ca400c2de1667cc639b450a91ee42c6efb88d4036926d7ef06b30031451c220d1f43680b002c480bfb0c5e726ad2db14f98517060c8b74fad556dacc3'
        '3e7f2aa4266de572fec54dfb8521ea6fd8acf36e8b9752e4280e6d56d737ec87a5a8a1ac6b287a948453735a89e3d3c0614e6ca1716dd3676e4c9d080d016578'
        '923bfada8484a3bb91dd92a242d7096017b77fd399a90052af121658221069215e277d51fb4b9b95821b9272e44618f91883c2dc49bfb671c52a941d54aec182'
        '0e60f4230975ccf83f1cd82e4effdac4e4e7a8eaa718f6244a132f727d15df3f0d264812b741fa770ff1c1e12e49bf017c126035cb234d66cec0bc9a2bae67e5'
        '17b054083ce178255f19026d175986225f6f803a21e0cef4ce9a557ac50057578d3ae76d3b179fe25d0febd5e05d5d5feb28f9761045a8e41497b92a966196ec'
        '2842b50f7b6640c8d6f07f4be715b3152f1b9b35eede8d4035581654cc3bd86f52bec13fe0b0aadca27f4b75b0f5f2decce290234a9b6ae754c392da489f7a84'
        '208041ba68fc7b26d3fd800e1a26c79d8f011142fff1f6ea519d71972762299816eb10b3204a8bd4fe872bb19fe5639e5782db4e40333cb2073c7fb32153e6e7'
        '84892b7d19a90bafb7f0aea683eef9a3474697275e522e14ba9da65a0c46f5a38219ee02b60152d7d242e375bb6b59f9810d39ec19704575e5bc1629ab55e511'
        '1f982f09d202828eeaa06892904c83d301103894cea3a22b033c24fde3a40fc03a5957148430222e69029a32db3537d4e2a84d81cdb1dbd461d80a87cb82db8b'
        'ec1330941df3fff6538fbfc0e9609fb022ffe2507c3622242dc69a4c4758714f89452dcc0e0902cbe8fbfd3f76185b042adf7e386abdb2a202403b3d8786d6a2'
        '414379fcb08d78a96fd7788f3708e7ca41b1ea21a4145427f486704c563658c709b9eaddef360cca7cf42c3e0a6c3d7e400132957231f960f660bcc4f1b89db7'
        '8c7b4e1c788a07c1092be813555b1774a713693dd995183671d60b1896f96e105631447cb8c69bbcb13c380388b632d38a2c59be19903bc259ae6b57a181612a'
        '827f825cca32016e104391d1fbae1267526366023fe099c867aca74f91c4221e64c425c3364bcf9af3dab9ad7c016632d97d0ae555ed7fad891fd7eb22930aa8'
        '8231e423a08e53ce5629d1360c58b532c71643691afe85a6bbaaef7c5526d77b1a319ae1885741babeeac58142d708829eb5dcbdfe5d44af5f887ae52c8fd77a'
        '270c4b06ce519e4ac8a4b64dc33afc33b1264f5cddd96ad22311d5f48d87964b133e507018df504fffec57edc83ca2f4ed2e3840e24759d36cf40c06931f9b79'
        '6ea841222758a00bb704dbe2c269a44af3fabeeaa761682e89042fe42f5d4d92eebb5e7c31772873b624e9120295fb75178740f9d98da9fa53c32eb4b5e5cdf3'
        'da35be2f89c4aa19e4d956f2929184653c9dcafdd6f7fa8b463e23bb6b449bb4ad17ea526ea11eb1dae460ff26c4c45e219de6e93afaeb9fe9042e91ac7a64eb'
        '098d5dccfec93ea0e23e488f3c9e8f54ea3a380c5d1e27b10b3c1564f026273924cf7474bbd25e79cf4771b5fef7332bab489cc9394890aea468859f57ba369c'
        'a2472c45d6dada6676296dd7a0b560be6b5c4a9d731445b1f7d49b871647512bc231033e796c0434deab4bd70b7209942d4aed6fab0fe839d8ccc0739d523832'
        '4a4809bd2c1f03b0ecda9a2583c84fb7f0a040f362bcd96f2639b062b8a5dbdb4da214f1f14d56664e59f0c964413db8f6d1722ece59c9a36629fb50d2b56c92')

declare -rAg _modules_name_map=(
  # rpcs3
  [3rdparty/7zip/7zip]=https://github.com/ip7z/7zip/archive/e5431fa6f5505e385c6f9367260717e9c47dc2ee.tar.gz
  # [3rdparty/FAudio]=https://github.com/FNA-XNA/FAudio/archive/af74e661c1bd8b105840d14485cc01d9c782b513.tar.gz
  [3rdparty/GPUOpen/VulkanMemoryAllocator]=https://github.com/Megamouse/VulkanMemoryAllocator/archive/37064843398c69cc0ca7f8cf5b33128c03a2bd74.tar.gz
  [3rdparty/OpenAL/openal-soft]=https://github.com/kcat/openal-soft/archive/90191edd20bb877c5cbddfdac7ec0fe49ad93727.tar.gz
  [3rdparty/SoundTouch/soundtouch]=https://github.com/RPCS3/soundtouch/archive/394e1f58b23dc80599214d2e9b6a5e0dfd0bbe07.tar.gz
  [3rdparty/asmjit/asmjit]=https://github.com/asmjit/asmjit/archive/416f7356967c1f66784dc1580fe157f9406d8bff.tar.gz
  [3rdparty/cubeb/cubeb]=https://github.com/mozilla/cubeb/archive/70b4e3db7822de4d534959885cda109d6edbee36.tar.gz
  # [3rdparty/curl/curl]=https://github.com/curl/curl/archive/57495c64871d18905a0941db9196ef90bafe9a29.tar.gz
  [3rdparty/discord-rpc/discord-rpc]=https://github.com/Vestrel/discord-rpc/archive/171b2142ac8acdf016c231e36dc7a8d48daff19c.tar.gz
  # [3rdparty/ffmpeg]=https://github.com/RPCS3/ffmpeg-core/archive/ec6367d3ba9d0d57b9d22d4b87da8144acaf428f.tar.gz
  # [3rdparty/flatbuffers]=https://github.com/google/flatbuffers/archive/595bf0007ab1929570c7671f091313c8fc20644e.tar.gz
  [3rdparty/fusion/fusion]=https://github.com/xioTechnologies/Fusion/archive/066d4a63b2c714b20b0a8073a01fda7c5c6763f6.tar.gz
  [3rdparty/glslang/glslang]=https://github.com/KhronosGroup/glslang/archive/36d08c0d940cf307a23928299ef52c7970d8cee6.tar.gz
  [3rdparty/hidapi/hidapi]=https://github.com/RPCS3/hidapi/archive/6bfdcf7368169efe1b745cd4468d45cda05ef8de.tar.gz
  # [3rdparty/libpng/libpng]=https://github.com/glennrp/libpng/archive/872555f4ba910252783af1507f9e7fe1653be252.tar.gz
  # [3rdparty/libsdl-org/SDL]=https://github.com/libsdl-org/SDL/archive/7a44b1ab002cee6efa56d3b4c0e146b7fbaed80b.tar.gz
  # [3rdparty/libusb/libusb]=https://github.com/libusb/libusb/archive/d52e355daa09f17ce64819122cb067b8a2ee0d4b.tar.gz
  # [3rdparty/llvm/llvm]=https://github.com/llvm/llvm-project/archive/cd708029e0b2869e80abe31ddb175f7c35361f90.tar.gz
  [3rdparty/miniupnp/miniupnp]=https://github.com/miniupnp/miniupnp/archive/7f189988a0decca0ab7da89000051ab91751f70d.tar.gz
  # [3rdparty/opencv/opencv]=https://github.com/opencv/opencv/archive/f76628fb5b25746fcb75a7ce85be0d8c6439fc57.tar.gz
  # [3rdparty/pugixml]=https://github.com/zeux/pugixml/archive/ee86beb30e4973f5feffe3ce63bfa4fbadf72f38.tar.gz
  [3rdparty/rtmidi/rtmidi]=https://github.com/thestk/rtmidi/archive/1e5b49925aa60065db52de44c366d446a902547b.tar.gz
  [3rdparty/stblib/stb]=https://github.com/nothings/stb/archive/013ac3beddff3dbffafd5177e7972067cd2b5083.tar.gz
  [3rdparty/wolfssl/wolfssl]=https://github.com/wolfSSL/wolfssl/archive/239b85c80438bf60d9a5b9e0ebe9ff097a760d0d.tar.gz
  [3rdparty/yaml-cpp/yaml-cpp]=https://github.com/RPCS3/yaml-cpp/archive/456c68f452da09d8ca84b375faa2b1397713eaba.tar.gz
  # [3rdparty/zlib/zlib]=https://github.com/madler/zlib/archive/51b7f2abdade71cd9bb0e7a373ef2610ec6f9daf.tar.gz
  [3rdparty/zstd/zstd]=https://github.com/facebook/zstd/archive/f8745da6ff1ad1e7bab384bd1f9d742439278e99.tar.gz

  # cubeb
  [3rdparty/cubeb/cubeb/cmake/sanitizers-cmake]=https://github.com/arsenm/sanitizers-cmake/archive/aab6948fa863bc1cbe5d0850bc46b9ef02ed4c1a.tar.gz
  [3rdparty/cubeb/cubeb/googletest]=https://github.com/google/googletest/archive/800f5422ac9d9e0ad59cd860a2ef3a679588acb4.tar.gz
  # discord-rpc
  # [3rdparty/discord-rpc/discord-rpc/thirdparty/rapidjson-1.1.0/thirdparty/gtest]=
)

declare -rg _ignore_modules=(
  "3rdparty/FAudio"
  "3rdparty/curl/curl"
  "3rdparty/ffmpeg"
  "3rdparty/flatbuffers"
  "3rdparty/libpng/libpng"
  "3rdparty/libsdl-org/SDL"
  "3rdparty/libusb/libusb"
  "3rdparty/llvm/llvm"
  "3rdparty/opencv/opencv"
  "3rdparty/pugixml"
  # "3rdparty/wolfssl/wolfssl"
  "3rdparty/zlib/zlib"
  "3rdparty/discord-rpc/discord-rpc/thirdparty/rapidjson-1.1.0/thirdparty/gtest"
)

_get_source_name_string() {
  local host filename name commit
  host=$(echo "$1" | cut -d / -f 3)
  name=$(echo "$1" | cut -d / -f 5)
  filename=${1##*/}
  commit=${filename%%.*}
  case "$host" in
    gitlab.com)
      # It contains $name in $commit
      echo "$commit"
      ;;
    *)
      echo "$name-$commit"
      ;;
  esac
}

_fill_gitmodules_recursively() {
  local gitmodule
  find "${1:-.}" -type f -name .gitmodules | while read -r gitmodule
  do
    if [[ "$gitmodule" =~ ^\.\/ ]]
    then
      gitmodule=${gitmodule#*\.\/}
    fi
    local prefix
    prefix=$(dirname "$gitmodule")"/"
    if [[ "$prefix" =~ ^\.\/ ]]
    then
      prefix=${prefix#*\.\/}
    fi
    echo "Parsing $gitmodule to fill submodules..."
    local p
    grep path "$gitmodule" | awk '{print $3}' | while read -r p
    do
      p=${p%$'\r'} # Remove control characters
      if [[ -n "$p" ]]
      then
        local target url name commit fname
        target="$prefix$p"

        # Check if $target matches any ignored submodules
        for ignore in "${_ignore_modules[@]}"; do
          if [[ "$target" == *"$ignore"* ]]; then
            echo "Ignoring submodule: $target"
            continue 2
          fi
        done

        url="${_modules_name_map[$target]}"
        fname=$(_get_source_name_string "$url")
        echo "Filling $target with $srcdir/$fname..."
        cp -r "$srcdir/$fname/." "$target"
        _fill_gitmodules_recursively "$target"
      fi
    done
  done
}

declare _source_str _uri
for _uri in "${_modules_name_map[@]}"; do
  _source_str="$(_get_source_name_string "$_uri").tar.gz::$_uri"
  if [[ "${source[*]/$_source_str/}" == "${source[*]}" ]]
  then
    source+=("$_source_str")
  fi
done
unset _source_str _uri

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  _fill_gitmodules_recursively

  patch -Np1 -i "${srcdir}/${pkgname}_qt690_atomic.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_qt690_setDefaultSectionSize.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_gcc15_cstdint.patch"

  cd "${pkgname}"
  sed -e "s/set(RPCS3_GIT_VERSION \"local_build\")/set(RPCS3_GIT_VERSION \"${pkgver}+AUR-${pkgrel}\")/g" \
      -e 's/set(RPCS3_GIT_BRANCH "local_build")/set(RPCS3_GIT_BRANCH "master")/g' \
      -i 'git-version.cmake'
}

build() {
  export CC="clang"
  export CXX="clang++"
  export CXXFLAGS="${CXXFLAGS//'-Wp,-D_GLIBCXX_ASSERTIONS'/}" # causes unwanted assertions and crashes rpcs3
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
    -D CMAKE_SKIP_RPATH=ON
    -D CMAKE_LINKER=lld
    -D CMAKE_SHARED_LINKER_FLAGS="-fuse-ld=lld"
    -D CMAKE_EXE_LINKER_FLAGS="-fuse-ld=lld"
    -D USE_NATIVE_INSTRUCTIONS=OFF # disable '-march=native'
    -D USE_SYSTEM_FAUDIO=ON
    -D USE_SYSTEM_CURL=ON
    -D USE_SYSTEM_FFMPEG=ON
    -D USE_SYSTEM_FLATBUFFERS=ON
    -D USE_SYSTEM_LIBPNG=ON
    -D USE_SDL=ON
    -D USE_SYSTEM_SDL=ON
    -D USE_SYSTEM_LIBUSB=ON
    -D WITH_LLVM=ON
    -D BUILD_LLVM=OFF
    -D USE_SYSTEM_OPENCV=ON
    -D USE_SYSTEM_PUGIXML=ON
    -D USE_SYSTEM_WOLFSSL=OFF
    -D USE_SYSTEM_ZLIB=ON
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
