pkgname=cppdap
pkgver=1.58.0a
pkgrel=1
pkgdesc="C++ library for the Debug Adapter Protocol"
arch=('x86_64')
url='https://github.com/google/cppdap'
license=('Apache-2.0')
makedepends=('cmake' 'nlohmann-json')
options=('!strip')
source=('git+https://github.com/google/cppdap')
sha1sums=('SKIP')
source=("https://github.com/google/cppdap/archive/refs/tags/dap-1.58.0-a.tar.gz")
sha256sums=('5d35ca5db78570b6bef698e3365f79bd82a4f78e8393546387f78d7bdb2a2a08')

build() {
  cmake -B build -S cppdap-dap-1.58.0-a \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DEEECMAKE_INSTALL_LIBEXECDIR=lib \
        -DCPPDAP_USE_EXTERNAL_NLOHMANN_JSON_PACKAGE=ON \
        -DCPPDAP_USE_EXTERNAL_RAPIDJSON_PACKAGE=OFF \
        -DCPPDAP_USE_EXTERNAL_JSONCPP_PACKAGE=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
