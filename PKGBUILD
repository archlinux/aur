pkgname=lindora
pkgver=1.1
pkgrel=0
pkgdesc="An unofficial site-specific browser wrapper for the Pandora web service."
arch=('x86_64')
url="https://github.com/Logawinner/Lindora"
license=('GPL 3')

depends=(
'qt6-base'
'qt6-webengine'
'qt6-svg'
)

makedepends=(
'git'
'cmake'
)

source=(
"git+https://github.com/Logawinner/Lindora.git"
)

sha256sums=('SKIP')

build() {
cd "${srcdir}/Lindora"

cmake -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build

}

package() {
cd "${srcdir}/Lindora"

# Install using CMake's own install rules (cleanest)
DESTDIR="${pkgdir}" cmake --install build

install -Dm644 Lindora.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/lindora.svg"

install -Dm644 lindora-native.desktop \
    "${pkgdir}/usr/share/applications/lindora-native.desktop"

}

