# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Christopher Snowhill <kode54@gmail.com>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Sanpi <sanpi+aur@homecomputing.fr>

pkgname="rpcs3"
pkgver=0.0.37
pkgrel=1
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
optdepends=('ps3-disc-dumper: recommended tool for dumping games'
            'rpcs3-udev: support DualShock 3, 4 and DualSense controllers'
            'vulkan-validation-layers')
options=('!lto' '!strip')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}_gcc15_cstdint.patch")
b2sums=('613463695e41366161d59b8a43a55bbfff995ce3f9a3ec026f5030f51a8e7992badfa9e022fa0be5edc3973ec2a3c408969ce10e1c5fecd7616b5fe6bef12cc7'
        '3e7f2aa4266de572fec54dfb8521ea6fd8acf36e8b9752e4280e6d56d737ec87a5a8a1ac6b287a948453735a89e3d3c0614e6ca1716dd3676e4c9d080d016578'
        '9dd4295d81ffaac556f31ff415f37dd7da2050135b35ba464760312969302dd09e01a5676a26f05eb9c8fb219d8e21350778c7c7ad9262545edc479588ffacf9'
        '717d36c5fe3e64089bf550844caaa61cdd532d6b37216427d7bcbd9af12df0cf7bd474d8e79c217d28646f69b7d1a388eb50ea1006760b06d09b74ff140d734e'
        '17b054083ce178255f19026d175986225f6f803a21e0cef4ce9a557ac50057578d3ae76d3b179fe25d0febd5e05d5d5feb28f9761045a8e41497b92a966196ec'
        '2842b50f7b6640c8d6f07f4be715b3152f1b9b35eede8d4035581654cc3bd86f52bec13fe0b0aadca27f4b75b0f5f2decce290234a9b6ae754c392da489f7a84'
        '58358d00186830ad0d9a23a551949d9437cc6a949b835c623730f06371f166bcf43433b96c3b80572d4ab907775258051bbea73f9cd7e2d9a0c36fa5ec4bf525'
        'b6b9daa3ac39ade3bcad773016404376286bb5bb0e6e6ce74519fe0ddf34ba0c7f71910b12b0a630534fb00d73c77941ae69b33d14da441f2c03087261d5cc7c'
        'a54d279c64eb0d4d3d8d9445de7a4e1cdf250546af96ed8739f4dea5f4037b3139807e492847425055cc2e82482a110fabd0478e40520647e58dc4487f452420'
        'ec1330941df3fff6538fbfc0e9609fb022ffe2507c3622242dc69a4c4758714f89452dcc0e0902cbe8fbfd3f76185b042adf7e386abdb2a202403b3d8786d6a2'
        '050b82b81cf55e6a2b77f25ec1bb481e4d545b9a07668456610fb913b9161b7e7dc4f4b763c5059199e00fb0d1d16576b04a562673791c76d1460d1f3547f67f'
        '8c7b4e1c788a07c1092be813555b1774a713693dd995183671d60b1896f96e105631447cb8c69bbcb13c380388b632d38a2c59be19903bc259ae6b57a181612a'
        '827f825cca32016e104391d1fbae1267526366023fe099c867aca74f91c4221e64c425c3364bcf9af3dab9ad7c016632d97d0ae555ed7fad891fd7eb22930aa8'
        '8231e423a08e53ce5629d1360c58b532c71643691afe85a6bbaaef7c5526d77b1a319ae1885741babeeac58142d708829eb5dcbdfe5d44af5f887ae52c8fd77a'
        '3a94c7c7d493aea59336181dcf6b22feab47609823c1ba7461a1ffa5fda0c966f92de462ec79f7f90cadc9235001de5a697b251d24533eb201f0fad08d7e8d1a'
        '6ea841222758a00bb704dbe2c269a44af3fabeeaa761682e89042fe42f5d4d92eebb5e7c31772873b624e9120295fb75178740f9d98da9fa53c32eb4b5e5cdf3'
        'b65c89143c9e6439fc1b71913de5752e7efe5a885938196e6d5d2281eb795328c8eeef76eca622a34d6b9abf41da385cfa9b894bc96b3f0dabfb46bd2eb694f7'
        '098d5dccfec93ea0e23e488f3c9e8f54ea3a380c5d1e27b10b3c1564f026273924cf7474bbd25e79cf4771b5fef7332bab489cc9394890aea468859f57ba369c'
        'a2472c45d6dada6676296dd7a0b560be6b5c4a9d731445b1f7d49b871647512bc231033e796c0434deab4bd70b7209942d4aed6fab0fe839d8ccc0739d523832'
        '4a4809bd2c1f03b0ecda9a2583c84fb7f0a040f362bcd96f2639b062b8a5dbdb4da214f1f14d56664e59f0c964413db8f6d1722ece59c9a36629fb50d2b56c92')

declare -rAg _modules_name_map=(
  # rpcs3
  [3rdparty/7zip/7zip]=https://github.com/ip7z/7zip/archive/e5431fa6f5505e385c6f9367260717e9c47dc2ee.tar.gz
  # [3rdparty/FAudio]=https://github.com/FNA-XNA/FAudio/archive/6077ea740a7114a54f76ed9b7abe08cffc0034b6.tar.gz
  [3rdparty/GPUOpen/VulkanMemoryAllocator]=https://github.com/Megamouse/VulkanMemoryAllocator/archive/1d8f600fd424278486eade7ed3e877c99f0846b1.tar.gz
  [3rdparty/OpenAL/openal-soft]=https://github.com/kcat/openal-soft/archive/dc7d7054a5b4f3bec1dc23a42fd616a0847af948.tar.gz
  [3rdparty/SoundTouch/soundtouch]=https://github.com/RPCS3/soundtouch/archive/3982730833b6daefe77dcfb32b5c282851640c17.tar.gz
  [3rdparty/asmjit/asmjit]=https://github.com/asmjit/asmjit/archive/416f7356967c1f66784dc1580fe157f9406d8bff.tar.gz
  [3rdparty/cubeb/cubeb]=https://github.com/mozilla/cubeb/archive/70b4e3db7822de4d534959885cda109d6edbee36.tar.gz
  # [3rdparty/curl/curl]=https://github.com/curl/curl/archive/4dacb79fcdd9364c1083e06f6a011d797a344f47.tar.gz
  [3rdparty/discord-rpc/discord-rpc]=https://github.com/Vestrel/discord-rpc/archive/3dc2c326cb4dc5815c6069970c13154898f58d48.tar.gz
  # [3rdparty/ffmpeg]=https://github.com/RPCS3/ffmpeg-core/archive/ec6367d3ba9d0d57b9d22d4b87da8144acaf428f.tar.gz
  # [3rdparty/flatbuffers]=https://github.com/google/flatbuffers/archive/595bf0007ab1929570c7671f091313c8fc20644e.tar.gz
  [3rdparty/fusion/fusion]=https://github.com/xioTechnologies/Fusion/archive/066d4a63b2c714b20b0a8073a01fda7c5c6763f6.tar.gz
  [3rdparty/glslang/glslang]=https://github.com/KhronosGroup/glslang/archive/fc9889c889561c5882e83819dcaffef5ed45529b.tar.gz
  [3rdparty/hidapi/hidapi]=https://github.com/RPCS3/hidapi/archive/f42423643ec9011c98cccc0bb790722bbbd3f30b.tar.gz
  # [3rdparty/libpng/libpng]=https://github.com/glennrp/libpng/archive/ea127968204cc5d10f3fc9250c306b9e8cbd9b80.tar.gz
  # [3rdparty/libsdl-org/SDL]=https://github.com/libsdl-org/SDL/archive/8d604353a53853fa56d1bdce0363535605ca868f.tar.gz
  # [3rdparty/libusb/libusb]=https://github.com/libusb/libusb/archive/a61afe5f75d969c4561a1d0ad753aa23cee6329a.tar.gz
  # [3rdparty/llvm/llvm]=https://github.com/llvm/llvm-project/archive/cd708029e0b2869e80abe31ddb175f7c35361f90.tar.gz
  # [3rdparty/miniupnp/miniupnp]=https://github.com/miniupnp/miniupnp/archive/d66872e34d9ff83a07f8b71371b13419b2089953.tar.gz
  [3rdparty/miniupnp/miniupnp]=https://github.com/miniupnp/miniupnp/archive/refs/tags/miniupnpd_2_3_9.tar.gz
  # [3rdparty/opencv/opencv]=https://github.com/opencv/opencv/archive/f76628fb5b25746fcb75a7ce85be0d8c6439fc57.tar.gz
  # [3rdparty/pugixml]=https://github.com/zeux/pugixml/archive/ee86beb30e4973f5feffe3ce63bfa4fbadf72f38.tar.gz
  [3rdparty/rtmidi/rtmidi]=https://github.com/thestk/rtmidi/archive/1e5b49925aa60065db52de44c366d446a902547b.tar.gz
  [3rdparty/stblib/stb]=https://github.com/nothings/stb/archive/013ac3beddff3dbffafd5177e7972067cd2b5083.tar.gz
  [3rdparty/wolfssl/wolfssl]=https://github.com/wolfSSL/wolfssl/archive/b077c81eb635392e694ccedbab8b644297ec0285.tar.gz
  [3rdparty/yaml-cpp/yaml-cpp]=https://github.com/RPCS3/yaml-cpp/archive/456c68f452da09d8ca84b375faa2b1397713eaba.tar.gz
  # [3rdparty/zlib/zlib]=https://github.com/madler/zlib/archive/51b7f2abdade71cd9bb0e7a373ef2610ec6f9daf.tar.gz
  [3rdparty/zstd/zstd]=https://github.com/facebook/zstd/archive/f8745da6ff1ad1e7bab384bd1f9d742439278e99.tar.gz

  # 3rdparty/cubeb/cubeb
  [3rdparty/cubeb/cubeb/cmake/sanitizers-cmake]=https://github.com/arsenm/sanitizers-cmake/archive/aab6948fa863bc1cbe5d0850bc46b9ef02ed4c1a.tar.gz
  [3rdparty/cubeb/cubeb/googletest]=https://github.com/google/googletest/archive/800f5422ac9d9e0ad59cd860a2ef3a679588acb4.tar.gz
  # 3rdparty/discord-rpc/discord-rpc
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

  patch -Np1 -i "${srcdir}/${pkgname}_gcc15_cstdint.patch"

  cd "${pkgname}"
  sed -e "s/set(RPCS3_GIT_VERSION \"local_build\")/set(RPCS3_GIT_VERSION \"${pkgver}-${pkgrel} (AUR)\")/g" \
      -e 's/set(RPCS3_GIT_BRANCH "local_build")/set(RPCS3_GIT_BRANCH "master")/g' \
      -i 'git-version.cmake'
}

build() {
  export CC="clang"
  export CXX="clang++"
  export CXXFLAGS="${CXXFLAGS//'-Wp,-D_GLIBCXX_ASSERTIONS'/}" # causes unwanted assertions and crashes rpcs3
  export LDFLAGS+=" -fuse-ld=lld"
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
