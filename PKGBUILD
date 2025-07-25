pkgname=dlt-viewer
pkgver=2.28.0
_commit=300a20461e8f1505ff891b211b3b69dc28c04e9a # tags/v2.28.0
pkgrel=1
pkgdesc="Diagnostic Log and Trace client viewer"
url="https://github.com/GENIVI/dlt-viewer/"
arch=('x86_64' 'i686')
license=('MPL-2.0')
depends=(qt6-base qt6-serialport)
source=("git+https://github.com/GENIVI/dlt-viewer.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
    cmake \
        -B build \
        -S "${pkgname}" \
        -DCMAKE_BUILD_TYPE:STRING=Release \
        -DDLT_USE_STANDARD_INSTALLATION_LOCATION:BOOL=ON \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
