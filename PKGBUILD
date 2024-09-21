# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Christopher Snowhill <kode54@gmail.com>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Sanpi <sanpi+aur@homecomputing.fr>

pkgname="rpcs3"
pkgver=0.0.33
pkgrel=1
pkgdesc="An open-source PlayStation 3 emulator/debugger written in C++"
arch=('x86_64')
url="https://rpcs3.net"
_url="https://github.com/RPCS3/${pkgname}"
license=('GPL-2.0-only')
# clang is required because audio is broken with latest gcc
makedepends=('cmake>=3.16.9' 'clang>=12' 'libglvnd' 'llvm' 'python')
# Use bundled FFMPEG for now since we use FFMPEG 5.1.2
depends=('alsa-lib' 'curl' 'flatbuffers' 'gcc-libs' 'glew' 'glibc' 'glu'
         'hicolor-icon-theme' 'libevdev' 'libgl' 'libice' 'libpng' 'libpulse'
         'libsm' 'libx11' 'libxext' 'llvm-libs' 'openal' 'pugixml' 'sdl2'
         'systemd-libs' 'qt6-base' 'qt6-declarative' 'qt6-multimedia' 'qt6-svg'
         'vulkan-icd-loader' 'zlib') # libavcodec.so libavutil.so libswscale.so
optdepends=('vulkan-validation-layers'
            'rpcs3-udev: support DualShock 3, 4 and DualSense controllers')
options=('!lto' '!strip')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/v${pkgver}.tar.gz")
b2sums=('8ab72e581b2655bb24cebed02fb4b0e3ccdc5942d5b2a8789b91c34a624da3a76b8331479046f2002867f6834d6c44a8961fbab00676991132ac68a995562512'
        '923bfada8484a3bb91dd92a242d7096017b77fd399a90052af121658221069215e277d51fb4b9b95821b9272e44618f91883c2dc49bfb671c52a941d54aec182'
        '3e8dfe67c9401a32ae9cdea9f03ef929e6378e55af4edb5b26c4e8bd91e21ff91d5cae73bf858b4dfcc292ca0ac4ba667baf373e9f5d093e26ea6287dd677bee'
        '17b054083ce178255f19026d175986225f6f803a21e0cef4ce9a557ac50057578d3ae76d3b179fe25d0febd5e05d5d5feb28f9761045a8e41497b92a966196ec'
        '2842b50f7b6640c8d6f07f4be715b3152f1b9b35eede8d4035581654cc3bd86f52bec13fe0b0aadca27f4b75b0f5f2decce290234a9b6ae754c392da489f7a84'
        '208041ba68fc7b26d3fd800e1a26c79d8f011142fff1f6ea519d71972762299816eb10b3204a8bd4fe872bb19fe5639e5782db4e40333cb2073c7fb32153e6e7'
        'f97011530cf94c31cac192c3a78151ebde1a25f77afdea634706648c108919ff33dff40eb127b18c1bd4f2e08dea565ccd6716be76813981ee2333242a136197'
        '8c7b4e1c788a07c1092be813555b1774a713693dd995183671d60b1896f96e105631447cb8c69bbcb13c380388b632d38a2c59be19903bc259ae6b57a181612a'
        '26c97a11ab05ff93fa8b184bc5662c37926c4c704309742a47220eab658a16487232b05341b5e3d0a3771d0ee74233da39d191b57c98c9754b6b202f486f6276'
        '4d6cbe50701120da5c1877118189814d9d42974810ac272b950e40c7504b76cf3b54d2454d8d47ecee0e835bf7216414533b0a5a959e684d0a19706ecc986c83'
        '8231e423a08e53ce5629d1360c58b532c71643691afe85a6bbaaef7c5526d77b1a319ae1885741babeeac58142d708829eb5dcbdfe5d44af5f887ae52c8fd77a'
        '55e96becfe38e5810b8db88c42aaeefe801abe8c92118f42e8cc7d269842a689ac59d12c41ba0d7fc6af31ec30378b702bd9b15d914bd4fda3270be6eed64dcd'
        '6ea841222758a00bb704dbe2c269a44af3fabeeaa761682e89042fe42f5d4d92eebb5e7c31772873b624e9120295fb75178740f9d98da9fa53c32eb4b5e5cdf3'
        'fd20f7db800c5b2e53c05f54ee0093a41e1cd52a06aa7cf48afd33dc19fafc965757260445df45f82820b87b706934fca16b7c476e3caa6f652874a9fe27e819'
        '2fc01536430912def4bb1a6e155b6fa3e82ac77f916ab635f4bb7d5effbb5cb4ec60889e016be1524dfffc1c7810225c4385e6a2d80b70b0bffee602b94aad80'
        'da35be2f89c4aa19e4d956f2929184653c9dcafdd6f7fa8b463e23bb6b449bb4ad17ea526ea11eb1dae460ff26c4c45e219de6e93afaeb9fe9042e91ac7a64eb'
        '913a264e83f660258e66bcbb3b89d0188a0508234c4816b712078b5cdebda876138ceb2f78e727c69865912eb5831c74626a368f774d630a13efd58430053ddd'
        'd563a7411c9380d79c36e741484197e1d09647b8e31e9ac21e1de0bddb3026da70a83e7a3f88d9fc07551be5ee69a9bfe6eb7b3a5fbfd8e3103fcd54f048fe7b'
        'a2472c45d6dada6676296dd7a0b560be6b5c4a9d731445b1f7d49b871647512bc231033e796c0434deab4bd70b7209942d4aed6fab0fe839d8ccc0739d523832'
        '4a4809bd2c1f03b0ecda9a2583c84fb7f0a040f362bcd96f2639b062b8a5dbdb4da214f1f14d56664e59f0c964413db8f6d1722ece59c9a36629fb50d2b56c92'
        'ec5a88697020338a881921ce4eb1aecff2ac97f0e83863c14daf2c47a162dbff121f137a048097489e9e226341e90d6c0ad531ad93e2a420c1695867604a1a04'
        '74a71b61656fd6181506aea67c1f25d699f1d5eb29e643b3ff7ecd5b641ab7dc3e19dad5371c1e7867316261f797a8d699b3de9236c80fb536ee1d793454cfda')

declare -Ag _modules_name_map=(
  [3rdparty/ffmpeg]=https://github.com/RPCS3/ffmpeg-core/archive/10d0ebc0b8c7c4f0b242c9998c8bdc4e55bb5067.tar.gz
  [3rdparty/asmjit/asmjit]=https://github.com/asmjit/asmjit/archive/416f7356967c1f66784dc1580fe157f9406d8bff.tar.gz
  # [3rdparty/llvm/llvm]=https://github.com/llvm/llvm-project/archive/cd89023f797900e4492da58b7bed36f702120011.tar.gz
  [3rdparty/glslang/glslang]=https://github.com/KhronosGroup/glslang/archive/36d08c0d940cf307a23928299ef52c7970d8cee6.tar.gz
  [3rdparty/SPIRV/SPIRV-Tools]=https://github.com/KhronosGroup/SPIRV-Tools/archive/360d469b9eac54d6c6e20f609f9ec35e3a5380ad.tar.gz
  [3rdparty/SPIRV/SPIRV-Headers]=https://github.com/KhronosGroup/SPIRV-Headers/archive/e867c06631767a2d96424cbec530f9ee5e78180f.tar.gz
  # [3rdparty/zlib/zlib]=https://github.com/madler/zlib/archive/51b7f2abdade71cd9bb0e7a373ef2610ec6f9daf.tar.gz
  [3rdparty/hidapi/hidapi]=https://github.com/RPCS3/hidapi/archive/8b43a97a9330f8b0035439ce9e255e4be202deca.tar.gz
  # [3rdparty/pugixml]=https://github.com/zeux/pugixml/archive/db78afc2b7d8f043b4bc6b185635d949ea2ed2a8.tar.gz
  [3rdparty/xxHash]=https://github.com/Cyan4973/xxHash/archive/bbb27a5efb85b92a0486cf361a8635715a53f6ba.tar.gz
  [3rdparty/yaml-cpp/yaml-cpp]=https://github.com/RPCS3/yaml-cpp/archive/456c68f452da09d8ca84b375faa2b1397713eaba.tar.gz
  # [3rdparty/libpng/libpng]=https://github.com/glennrp/libpng/archive/ed217e3e601d8e462f7fd1e04bed43ac42212429.tar.gz
  [3rdparty/libusb/libusb]=https://github.com/libusb/libusb/archive/d52e355daa09f17ce64819122cb067b8a2ee0d4b.tar.gz
  [3rdparty/FAudio]=https://github.com/FNA-XNA/FAudio/archive/d8db58212434963909c0e30ed987887fb02d74b1.tar.gz
  # [3rdparty/curl/curl]=https://github.com/curl/curl/archive/83bedbd730d62b83744cc26fa0433d3f6e2e4cd6.tar.gz
  [3rdparty/wolfssl/wolfssl]=https://github.com/wolfSSL/wolfssl/archive/00e42151ca061463ba6a95adb2290f678cbca472.tar.gz
  # [3rdparty/flatbuffers]=https://github.com/google/flatbuffers/archive/0100f6a5779831fa7a651e4b67ef389a8752bd9b.tar.gz
  [3rdparty/cubeb/cubeb]=https://github.com/mozilla/cubeb/archive/70b4e3db7822de4d534959885cda109d6edbee36.tar.gz
  [3rdparty/SoundTouch/soundtouch]=https://github.com/RPCS3/soundtouch/archive/394e1f58b23dc80599214d2e9b6a5e0dfd0bbe07.tar.gz
  # [3rdparty/libsdl-org/SDL]=https://github.com/libsdl-org/SDL/archive/ba2f78a0069118a6c583f1fbf1420144ffa35bad.tar.gz
  [3rdparty/miniupnp/miniupnp]=https://github.com/miniupnp/miniupnp/archive/7f189988a0decca0ab7da89000051ab91751f70d.tar.gz
  [3rdparty/rtmidi/rtmidi]=https://github.com/thestk/rtmidi/archive/1e5b49925aa60065db52de44c366d446a902547b.tar.gz
  [3rdparty/zstd/zstd]=https://github.com/facebook/zstd/archive/97291fc5020a8994019ab76cf0cda83a9824374c.tar.gz
  [3rdparty/7zip/7zip]=https://github.com/ip7z/7zip/archive/e008ce3976c087bfd21344af8f00a23cf69d4174.tar.gz
  [3rdparty/OpenAL/openal-soft]=https://github.com/kcat/openal-soft/archive/d3875f333fb6abe2f39d82caca329414871ae53b.tar.gz
  [3rdparty/stblib/stb]=https://github.com/nothings/stb/archive/013ac3beddff3dbffafd5177e7972067cd2b5083.tar.gz
  [3rdparty/cubeb/cubeb/googletest]=https://github.com/google/googletest/archive/800f5422ac9d9e0ad59cd860a2ef3a679588acb4.tar.gz
  [3rdparty/cubeb/cubeb/cmake/sanitizers-cmake]=https://github.com/arsenm/sanitizers-cmake/archive/aab6948fa863bc1cbe5d0850bc46b9ef02ed4c1a.tar.gz
)
declare -g _ignore_modules=(
  "3rdparty/llvm/llvm"
  "3rdparty/zlib/zlib"
  "3rdparty/pugixml"
  "3rdparty/libpng/libpng"
  "3rdparty/curl/curl"
  "3rdparty/flatbuffers"
  "3rdparty/libsdl-org/SDL"
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
for _uri in "${_modules_name_map[@]}"
do
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
}

build() {
  # GLIBCXX_ASSERTIONS is know to cause unwanted assertions and crash rpcs3
  BAD_FLAG="-Wp,-D_GLIBCXX_ASSERTIONS"
  CXXFLAGS="${CXXFLAGS//$BAD_FLAG/}"

  cd "${srcdir}"
  CC=clang CXX=clang++ cmake \
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DCMAKE_SKIP_RPATH=ON \
    -DUSE_NATIVE_INSTRUCTIONS=OFF \
    -DUSE_SYSTEM_FFMPEG=OFF \
    -DUSE_SYSTEM_LIBPNG=ON \
    -DUSE_SYSTEM_ZLIB=ON \
    -DUSE_SYSTEM_CURL=ON \
    -DUSE_SYSTEM_FLATBUFFERS=ON \
    -DUSE_SYSTEM_PUGIXML=ON \
    -DUSE_SDL=ON \
    -DUSE_SYSTEM_SDL=ON \
    -DBUILD_LLVM=OFF \
    -DUSE_SYSTEM_WOLFSSL=OFF \
    -Wno-dev
  cmake --build "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
