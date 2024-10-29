# Maintainer:

## options
: ${_qt_version:=5}

## basic info
_pkgname="maplibre-native"
pkgname="$_pkgname-git"
pkgver=3.0.0.r0.gd929c78
pkgrel=1
pkgdesc="C++ library that powers customizable vector maps in native applications"
url="https://github.com/maplibre/maplibre-native-qt"
arch=("x86_64" "aarch64")
license=(
  # core library
  'BSD-2-Clause'

  ## QML bindings (pick one)
  #'GPL-2.0-only'
  #'GPL-3.0-only'
  'LGPL-3.0-only'

  # examples
  'MIT'
)

depends=(
  "qt${_qt_version:-5}-base"
  "qt${_qt_version:-5}-location"
)
makedepends=(
  'cmake'
  'git'
  'glfw'
  'libwebp'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_source_main() {
  _pkgsrc="maplibre.maplibre-native-qt"
  source=("$_pkgsrc"::"git+$url.git")
  sha256sums=('SKIP')
}

_source_maplibre_native_qt() {
  source+=(
    'jothepro.doxygen-awesome-css'::'git+https://github.com/jothepro/doxygen-awesome-css.git'
    'maplibre.maplibre-native'::'git+https://github.com/maplibre/maplibre-native.git'
  )
  sha256sums+=(
    'SKIP'
    'SKIP'
  )

  _prepare_maplibre_native_qt() (
    cd "$srcdir/$_pkgsrc"
    local _submodules=(
      'jothepro.doxygen-awesome-css'::'docs/doxygen-awesome-css'
      'maplibre.maplibre-native'::'vendor/maplibre-native'
    )
    _submodule_update
  )
}

_source_maplibre_native() {
  source+=(
    'google.benchmark'::'git+https://github.com/google/benchmark.git'
    'google.googletest'::'git+https://github.com/google/googletest.git'
    #'jothepro.doxygen-awesome-css'::'git+https://github.com/jothepro/doxygen-awesome-css.git'
    'mapbox.earcut.hpp'::'git+https://github.com/mapbox/earcut.hpp.git'
    'mapbox.eternal'::'git+https://github.com/mapbox/eternal.git'
    'mapbox.mapbox-gestures-android'::'git+https://github.com/mapbox/mapbox-gestures-android.git'
    'mapbox.polylabel'::'git+https://github.com/mapbox/polylabel.git'
    'mapbox.protozero'::'git+https://github.com/mapbox/protozero.git'
    'mapbox.vector-tile'::'git+https://github.com/mapbox/vector-tile.git'
    'mapbox.wagyu'::'git+https://github.com/mapbox/wagyu.git'
    'maplibre.maplibre-gl-native-boost'::'git+https://github.com/maplibre/maplibre-gl-native-boost.git'
    'maplibre.maplibre-java'::'git+https://github.com/maplibre/maplibre-java.git'
    'maplibre.maplibre-native-base'::'git+https://github.com/maplibre/maplibre-native-base.git'
    #'martinus.unordered_dense'::'git+https://github.com/martinus/unordered_dense.git'
    #'microsoft.vcpkg'::'git+https://github.com/microsoft/vcpkg.git'
    'okdshin.unique_resource'::'git+https://github.com/okdshin/unique_resource.git'
    'yhirose.cpp-httplib'::'git+https://github.com/yhirose/cpp-httplib.git'
    'ziparchive'::'git+https://github.com/ZipArchive/ZipArchive.git'
  )
  sha256sums+=(
    #'SKIP'
    #'SKIP'
    #'SKIP'
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

  _prepare_maplibre_native() (
    cd "$srcdir/$_pkgsrc"
    cd 'vendor/maplibre-native'
    local _submodules=(
      'google.benchmark'::'vendor/benchmark'
      'google.googletest'::'vendor/googletest'
      #'jothepro.doxygen-awesome-css'::'docs/doxygen/doxygen-awesome-css'
      'mapbox.earcut.hpp'::'vendor/earcut.hpp'
      'mapbox.eternal'::'vendor/eternal'
      'mapbox.mapbox-gestures-android'::'platform/android/vendor/mapbox-gestures-android'
      'mapbox.polylabel'::'vendor/polylabel'
      'mapbox.protozero'::'vendor/protozero'
      'mapbox.vector-tile'::'vendor/vector-tile'
      'mapbox.wagyu'::'vendor/wagyu'
      'maplibre.maplibre-gl-native-boost'::'vendor/boost'
      'maplibre.maplibre-java'::'platform/android/vendor/maplibre-java'
      'maplibre.maplibre-native-base'::'vendor/mapbox-base'
      #'martinus.unordered_dense'::'vendor/unordered_dense'
      #'microsoft.vcpkg'::'platform/windows/vendor/vcpkg'
      'okdshin.unique_resource'::'vendor/unique_resource'
      'yhirose.cpp-httplib'::'vendor/cpp-httplib'
      'ziparchive'::'vendor/zip-archive'
    )
    _submodule_update
  )
}

_source_mapbox_earcut_hpp() {
  source+=(
    'glfw'::'git+https://github.com/glfw/glfw.git'
  )
  sha256sums+=(
    'SKIP'
  )

  _prepare_mapbox_earcut_hpp() (
    cd "$srcdir/$_pkgsrc"
    cd 'vendor/maplibre-native'
    cd 'vendor/earcut.hpp'
    local _submodules=(
      'glfw'::'glfw'
    )
    _submodule_update
  )
}

_source_mapbox_eternal() {
  source+=(
    #'google.benchmark'::'git+https://github.com/google/benchmark.git'
  )
  sha256sums+=(
    #'SKIP'
  )

  _prepare_mapbox_eternal() (
    cd "$srcdir/$_pkgsrc"
    cd 'vendor/maplibre-native'
    cd 'vendor/eternal'
    local _submodules=(
      'google.benchmark'::'vendor/benchmark'
    )
    _submodule_update
  )
}

_source_mapbox_polylabel() {
  source+=(
    'mapbox.mason'::'git+https://github.com/mapbox/mason.git'
  )
  sha256sums+=(
    'SKIP'
  )

  _prepare_mapbox_polylabel() (
    cd "$srcdir/$_pkgsrc"
    cd 'vendor/maplibre-native'
    cd 'vendor/polylabel'
    local _submodules=(
      'mapbox.mason'::'.mason'
    )
    _submodule_update
  )
}

_source_mapbox_vector_tile() {
  source+=(
    'mapbox.mvt-fixtures'::'git+https://github.com/mapbox/mvt-fixtures.git'
    'mapbox.mvt-bench-fixtures'::'git+https://github.com/mapbox/mvt-bench-fixtures.git'
  )
  sha256sums+=(
    'SKIP'
    'SKIP'
  )

  _prepare_mapbox_vector_tile() (
    cd "$srcdir/$_pkgsrc"
    cd 'vendor/maplibre-native'
    cd 'vendor/vector-tile'
    local _submodules=(
      'mapbox.mvt-fixtures'::'test/mvt-fixtures'
      'mapbox.mvt-bench-fixtures'::'bench/mvt-bench-fixtures'
    )
    _submodule_update
  )
}

_source_mapbox_wagyu() {
  source+=(
    'mapnik.geometry-test-data'::'git+https://github.com/mapnik/geometry-test-data.git'
  )
  sha256sums+=(
    'SKIP'
  )

  _prepare_mapbox_wagyu() (
    cd "$srcdir/$_pkgsrc"
    cd 'vendor/maplibre-native'
    cd 'vendor/wagyu'
    local _submodules=(
      'mapnik.geometry-test-data'::'tests/geometry-test-data'
    )
    _submodule_update
  )
}

_source_maplibre_maplibre_native_base() {
  source+=(
    #'google.googletest'::'git+https://github.com/google/googletest.git'
    'gulrak.filesystem'::'git+https://github.com/gulrak/filesystem.git'
    'mapbox.cheap-ruler-cpp'::'git+https://github.com/mapbox/cheap-ruler-cpp.git'
    'mapbox.geojson-vt-cpp'::'git+https://github.com/mapbox/geojson-vt-cpp.git'
    'mapbox.geojson.hpp'::'git+https://github.com/mapbox/geojson.hpp.git'
    'mapbox.geometry.hpp'::'git+https://github.com/mapbox/geometry.hpp.git'
    'mapbox.jni.hpp'::'git+https://github.com/mapbox/jni.hpp.git'
    'mapbox.optional'::'git+https://github.com/mapbox/Optional.git'
    'mapbox.pixelmatch-cpp'::'git+https://github.com/mapbox/pixelmatch-cpp.git'
    'mapbox.shelf-pack-cpp'::'git+https://github.com/mapbox/shelf-pack-cpp.git'
    'mapbox.supercluster.hpp'::'git+https://github.com/mapbox/supercluster.hpp.git'
    'mapbox.variant'::'git+https://github.com/mapbox/variant.git'
    'martinmoene.expected-lite'::'git+https://github.com/martinmoene/expected-lite.git'
    'mourner.kdbush.hpp'::'git+https://github.com/mourner/kdbush.hpp.git'
    'taywee.args'::'git+https://github.com/Taywee/args.git'
    'tencent.rapidjson'::'git+https://github.com/Tencent/rapidjson.git'
  )
  sha256sums+=(
    #'SKIP'
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

  _prepare_maplibre_maplibre_native_base() (
    cd "$srcdir/$_pkgsrc"
    cd 'vendor/maplibre-native'
    cd 'vendor/mapbox-base'
    local _submodules=(
      'google.googletest'::'extras/googletest'
      'gulrak.filesystem'::'extras/filesystem'
      'mapbox.cheap-ruler-cpp'::'deps/cheap-ruler-cpp'
      'mapbox.geojson-vt-cpp'::'deps/geojson-vt-cpp'
      'mapbox.geojson.hpp'::'deps/geojson.hpp'
      'mapbox.geometry.hpp'::'deps/geometry.hpp'
      'mapbox.jni.hpp'::'deps/jni.hpp'
      'mapbox.optional'::'deps/optional'
      'mapbox.pixelmatch-cpp'::'deps/pixelmatch-cpp'
      'mapbox.shelf-pack-cpp'::'deps/shelf-pack-cpp'
      'mapbox.supercluster.hpp'::'deps/supercluster.hpp'
      'mapbox.variant'::'deps/variant'
      'martinmoene.expected-lite'::'extras/expected-lite'
      'mourner.kdbush.hpp'::'extras/kdbush.hpp'
      'taywee.args'::'extras/args'
      'tencent.rapidjson'::'extras/rapidjson'
    )
    _submodule_update
  )
}

_source_mapbox_geojson_vt_cpp() {
  source+=(
    #'mapbox.mason'::'git+https://github.com/mapbox/mason.git'
  )
  sha256sums+=(
    #'SKIP'
  )

  _prepare_mapbox_geojson_vt_cpp() (
    cd "$srcdir/$_pkgsrc"
    cd 'vendor/maplibre-native'
    cd 'vendor/mapbox-base'
    cd 'deps/geojson-vt-cpp'
    local _submodules=(
      'mapbox.mason'::'.mason'
    )
    _submodule_update
  )
}

_source_mapbox_geojson_hpp() {
  source+=(
    #'mapbox.mason'::'git+https://github.com/mapbox/mason.git'
  )
  sha256sums+=(
    #'SKIP'
  )

  _prepare_mapbox_geojson_hpp() (
    cd "$srcdir/$_pkgsrc"
    cd 'vendor/maplibre-native'
    cd 'vendor/mapbox-base'
    cd 'deps/geojson.hpp'
    local _submodules=(
      'mapbox.mason'::'.mason'
    )
    _submodule_update
  )
}

_source_mapbox_supercluster_hpp() {
  source+=(
    #'mapbox.mason'::'git+https://github.com/mapbox/mason.git'
  )
  sha256sums+=(
    #'SKIP'
  )

  _prepare_mapbox_supercluster_hpp() (
    cd "$srcdir/$_pkgsrc"
    cd 'vendor/maplibre-native'
    cd 'vendor/mapbox-base'
    cd 'deps/supercluster.hpp'
    local _submodules=(
      'mapbox.mason'::'.mason'
    )
    _submodule_update
  )
}

_source_mapbox_variant() {
  source+=(
    #'mapbox.mason'::'git+https://github.com/mapbox/mason.git'
  )
  sha256sums+=(
    #'SKIP'
  )

  _prepare_mapbox_variant() (
    cd "$srcdir/$_pkgsrc"
    cd 'vendor/maplibre-native'
    cd 'vendor/mapbox-base'
    cd 'deps/variant'
    local _submodules=(
      'mapbox.mason'::'.mason'
    )
    _submodule_update
  )
}

_source_mourner_kdbush_hpp() {
  source+=(
    #'mapbox.mason'::'git+https://github.com/mapbox/mason.git'
  )
  sha256sums+=(
    #'SKIP'
  )

  _prepare_mourner_kdbush_hpp() (
    cd "$srcdir/$_pkgsrc"
    cd 'vendor/maplibre-native'
    cd 'vendor/mapbox-base'
    cd 'extras/kdbush.hpp'
    local _submodules=(
      'mapbox.mason'::'.mason'
    )
    _submodule_update
  )
}

_source_tencent_rapidjson() {
  source+=(
    #'google.googletest'::'git+https://github.com/google/googletest.git'
  )
  sha256sums+=(
    #'SKIP'
  )

  _prepare_tencent_rapidjson() (
    cd "$srcdir/$_pkgsrc"
    cd 'vendor/maplibre-native'
    cd 'vendor/mapbox-base'
    cd 'extras/rapidjson'
    local _submodules=(
      'google.googletest'::'thirdparty/gtest'
    )
    _submodule_update
  )
}

_source_mapbox_mvt_fixtures() {
  source+=(
    'mapbox.vector-tile-spec'::'git+https://github.com/mapbox/vector-tile-spec.git'
  )
  sha256sums+=(
    'SKIP'
  )

  _prepare_mapbox_mvt_fixtures() (
    cd "$srcdir/$_pkgsrc"
    cd 'vendor/maplibre-native'
    cd 'vendor/vector-tile'
    cd 'test/mvt-fixtures'
    local _submodules=(
      'mapbox.vector-tile-spec'::'vector-tile-spec'
    )
    _submodule_update
  )
}

_source_main

_source_maplibre_native_qt
_source_maplibre_native

## maplibre_native submodules
_source_mapbox_earcut_hpp
_source_mapbox_eternal
_source_mapbox_polylabel
_source_mapbox_vector_tile
_source_mapbox_wagyu
_source_maplibre_maplibre_native_base

## maplibre_native_base submodules
_source_mapbox_geojson_hpp
_source_mapbox_geojson_vt_cpp
_source_mapbox_supercluster_hpp
_source_mapbox_variant
_source_mourner_kdbush_hpp
_source_tencent_rapidjson

## vector_tile submodules
#_source_mapbox_mvt_fixtures

prepare() {
  _submodule_update() {
    local _module
    for _module in "${_submodules[@]}"; do
      git submodule init "${_module##*::}"
      git submodule set-url "${_module##*::}" "$srcdir/${_module%::*}"
      git -c protocol.file.allow=always submodule update "${_module##*::}"
    done
  }

  _prepare_maplibre_native_qt
  _prepare_maplibre_native

  ## maplibre_native submodules
  _prepare_mapbox_earcut_hpp
  _prepare_mapbox_eternal
  _prepare_mapbox_polylabel
  _prepare_mapbox_vector_tile
  _prepare_mapbox_wagyu
  _prepare_maplibre_maplibre_native_base

  ## maplibre_native_base submodules
  _prepare_mapbox_geojson_hpp
  _prepare_mapbox_geojson_vt_cpp
  _prepare_mapbox_supercluster_hpp
  _prepare_mapbox_variant
  _prepare_mourner_kdbush_hpp
  _prepare_tencent_rapidjson

  ## vector_tile submodules
  #_prepare_mapbox_mvt_fixtures
}

pkgver() (
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^[^0-9]+//;s/([^-]*-g)/r\1/;s/-/./g'
)

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSES"/*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"

  # from readme
  install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" << 'END'
Copyright (C) 2023 MapLibre contributors

The core library may be used under 2-Clause BSD License.
QML bindings may be used under the terms of either GNU General Public License version 2.0,
GNU General Public License version 3.0 or GNU Lesser General Public License version 3.0.
Examples are licensed under MIT.
Full texts of the licenses can be found in the [LICENSES](LICENSES) directory.

Each file contains corresponding license information with SPDX license identifiers
to clarify how it can be used.
END
}
