# Maintainer: Jean-Michaël Celerier <jeanmichael.celerier at gmail dot com>
# Useful commands :
# git submodule foreach --recursive --quiet 'git remote -v' | grep origin | grep -v push | awk '{ print "\"git+" $2 "\"" }'

# git submodule foreach  --quiet 'module=$(echo $name | rev | cut -d"/" -f1 | rev) ; echo "git config submodule.$path.url \$srcdir/$module"'

#  printf "'SKIP'%.0s\n" {1..43}
pkgname=ossia-score-git
pkgver=r9202.f90a636c8
pkgrel=1
pkgdesc="ossia score, an interactive sequencer for the intermedia arts (git master)"
arch=('x86_64')
url="https://ossia.io"
license=('GPLv3')
depends=('boost' 'qt5-base' 'qt5-imageformats' 'qt5-svg' 'qt5-websockets'
         'qt5-quickcontrols2' 'qt5-serialport' 'qt5-multimedia' 'qt5-declarative' 'ffmpeg' 'portaudio' 'jack')
makedepends=('git' 'cmake' 'qt5-tools')
optdepends=('faust' 'lilv' 'suil' 'sdl2' 'libfreenect2' 'qt5-shadertools-git' 'ysfx-git')
provides=('ossia-score-git')
conflicts=('ossia-score')
replaces=('i-score')

source=(
"git+https://github.com/jcelerier/QCodeEditor"
"git+https://github.com/Vidvox/hap"
"git+https://github.com/jcelerier/libsndfile"
"git+https://github.com/ossia/score"
"git+https://github.com/ossia/libossia"
"git+https://github.com/catchorg/Catch2"
"git+https://github.com/OculusVR/Flicks"
"git+https://github.com/jcelerier/GSL"
"git+https://github.com/jcelerier/Servus"
"git+https://github.com/jcelerier/dnssd"
"git+https://github.com/jcelerier/SmallFunction"
"git+https://github.com/ClaasBontus/bitset2"
"git+https://github.com/edouarda/brigand"
"git+https://github.com/Chobolabs/chobo-shl"
"git+https://github.com/cameron314/concurrentqueue"
"git+https://github.com/cpp-taskflow/cpp-taskflow"
"git+https://github.com/mackron/dr_libs"
"git+https://github.com/dr-soft/miniaudio.git"
"git+https://github.com/ArashPartow/exprtk"
"git+https://github.com/jcelerier/flat"
"git+https://github.com/jcelerier/flat_hash_map"
"git+https://github.com/fmtlib/fmt"
"git+https://github.com/serge-sans-paille/frozen"
"git+https://github.com/tessil/hopscotch-map.git"
"git+https://github.com/avilleret/ios-cmake.git"
"git+https://github.com/jcelerier/libartnet"
"git+https://github.com/jcelerier/libremidi"
"git+https://github.com/jcelerier/libsamplerate"
"git+https://github.com/ossia/max-sdk.git"
"git+https://github.com/jcelerier/multi_index"
"git+https://github.com/jcelerier/nano-signal-slot"
"git+https://github.com/jcelerier/oscpack"
"git+https://github.com/pybind/pybind11"
"git+https://github.com/avaneev/r8brain-free-src"
"git+https://github.com/maxbachmann/rapidfuzz-cpp.git"
"git+https://github.com/miloyip/rapidjson"
"git+https://github.com/google/googletest.git"
"git+https://github.com/cameron314/readerwriterqueue"
"git+https://github.com/jcelerier/rnd"
"git+https://github.com/jcelerier/rubberband/"
"git+https://github.com/gabime/spdlog"
"git+https://github.com/eggs-cpp/variant"
"git+https://github.com/jcelerier/verdigris"
"git+https://github.com/jcelerier/weakjack"
"git+https://github.com/jcelerier/websocketpp"
"git+https://github.com/gpakosz/whereami"
"git+https://github.com/OSSIA/wiiuse.git"
"git+https://github.com/OSSIA/cmake-modules"
"git+https://github.com/jcelerier/libpd"
"git+https://github.com/jcelerier/pure-data"
"git+https://github.com/jcelerier/magicitems"
"git+https://github.com/jcelerier/phantomstyle"
"git+https://github.com/jcelerier/snappy"
"git+https://github.com/google/benchmark.git"
"git+https://github.com/google/googletest.git"
"git+https://github.com/steinbergmedia/vst3_base"
"git+https://github.com/jcelerier/vst3_cmake"
"git+https://github.com/jcelerier/vst3_pluginterfaces"
"git+https://github.com/jcelerier/vst3_public_sdk"
"git+https://github.com/gulrak/filesystem"
"git+https://github.com/jcelerier/zipdownloader"
"git+https://github.com/Velron/doxygen-bootstrapped"
"git+https://github.com/jcelerier/QProgressIndicator"
"git+https://github.com/jcelerier/Qt-Color-Widgets.git"
)

sha256sums=(
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)

_gitname=score

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"

  git config submodule.3rdparty/QCodeEditor.url $srcdir/QCodeEditor
  git config submodule.3rdparty/hap.url $srcdir/hap
  git config submodule.3rdparty/libsndfile.url $srcdir/libsndfile
  git config submodule.3rdparty/libossia.url $srcdir/libossia
  git config submodule.3rdparty/libpd.url $srcdir/libpd
  git config submodule.3rdparty/magicitems.url $srcdir/magicitems
  git config submodule.3rdparty/phantomstyle.url $srcdir/phantomstyle
  git config submodule.3rdparty/snappy.url $srcdir/snappy
  git config submodule.3rdparty/vst3/base.url $srcdir/vst3_base
  git config submodule.3rdparty/vst3/cmake.url $srcdir/vst3_cmake
  git config submodule.3rdparty/vst3/pluginterfaces.url $srcdir/vst3_pluginterfaces
  git config submodule.3rdparty/vst3/public.sdk.url $srcdir/vst3_public_sdk
  git config submodule.3rdparty/zipdownloader.url $srcdir/zipdownloader
  git config submodule.docs/Doxygen/doxygen-bootstrapped.url $srcdir/doxygen-bootstrapped
  git config submodule.src/lib/3rdparty/QProgressIndicator.url $srcdir/QProgressIndicator
  git config submodule.src/lib/3rdparty/Qt-Color-Widgets.url $srcdir/Qt-Color-Widgets

  (
    cd 3rdparty/libossia
    git config submodule.3rdparty/Catch2.url $srcdir/Catch2
    git config submodule.3rdparty/Flicks.url $srcdir/Flicks
    git config submodule.3rdparty/GSL.url $srcdir/GSL
    git config submodule.3rdparty/Servus.url $srcdir/Servus
    git config submodule.3rdparty/SmallFunction.url $srcdir/SmallFunction
    git config submodule.3rdparty/bitset2.url $srcdir/bitset2
    git config submodule.3rdparty/brigand.url $srcdir/brigand
    git config submodule.3rdparty/chobo-shl.url $srcdir/chobo-shl
    git config submodule.3rdparty/concurrentqueue.url $srcdir/concurrentqueue
    git config submodule.3rdparty/cpp-taskflow.url $srcdir/cpp-taskflow
    git config submodule.3rdparty/dr_libs.url $srcdir/dr_libs
    git config submodule.3rdparty/exprtk.url $srcdir/exprtk
    git config submodule.3rdparty/flat.url $srcdir/flat
    git config submodule.3rdparty/flat_hash_map.url $srcdir/flat_hash_map
    git config submodule.3rdparty/fmt.url $srcdir/fmt
    git config submodule.3rdparty/frozen.url $srcdir/frozen
    git config submodule.3rdparty/hopscotch-map.url $srcdir/hopscotch-map
    git config submodule.3rdparty/ios-cmake.url $srcdir/ios-cmake
    git config submodule.3rdparty/libartnet.url $srcdir/libartnet
    git config submodule.3rdparty/libremidi.url $srcdir/libremidi
    git config submodule.3rdparty/libsamplerate.url $srcdir/libsamplerate
    git config submodule.3rdparty/max-sdk.url $srcdir/max-sdk
    git config submodule.3rdparty/multi_index.url $srcdir/multi_index
    git config submodule.3rdparty/nano-signal-slot.url $srcdir/nano-signal-slot
    git config submodule.3rdparty/oscpack.url $srcdir/oscpack
    git config submodule.3rdparty/pybind11.url $srcdir/pybind11
    git config submodule.3rdparty/r8brain-free-src.url $srcdir/r8brain-free-src
    git config submodule.3rdparty/rapidfuzz-cpp.url $srcdir/rapidfuzz-cpp
    git config submodule.3rdparty/rapidjson.url $srcdir/rapidjson
    git config submodule.3rdparty/readerwriterqueue.url $srcdir/readerwriterqueue
    git config submodule.3rdparty/rnd.url $srcdir/rnd
    git config submodule.3rdparty/rubberband.url $srcdir/rubberband
    git config submodule.3rdparty/spdlog.url $srcdir/spdlog
    git config submodule.3rdparty/variant.url $srcdir/variant
    git config submodule.3rdparty/verdigris.url $srcdir/verdigris
    git config submodule.3rdparty/weakjack.url $srcdir/weakjack
    git config submodule.3rdparty/websocketpp.url $srcdir/websocketpp
    git config submodule.3rdparty/whereami.url $srcdir/whereami
    git config submodule.3rdparty/wiiuse.url $srcdir/wiiuse
    git config submodule.cmake/cmake-modules.url $srcdir/cmake-modules
  )


  git checkout master
  git submodule update --init --recursive

  mkdir -p "$srcdir/build"
  cd "$srcdir/build"
  cmake -Wno-dev \
	      -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_UNITY_BUILD=1 \
        -DSCORE_PCH=0 \
        -DSCORE_STATIC_PLUGINS=1 \
        -DSCORE_FHS_BUILD=1 \
	      -DSCORE_DEPLOYMENT_BUILD=1 \
	      -DCMAKE_SKIP_RPATH=1 \
	      -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
	      "$srcdir/$_gitname"

  cmake --build . --parallel
}

package() {
  cd "$srcdir/build"
  cmake -DCMAKE_INSTALL_DO_STRIP=1 -DCOMPONENT=OssiaScore -P cmake_install.cmake
  rm -rf "$pkgdir/usr/share/faust"

  install -D -m644 "$srcdir/$_gitname/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
