# Maintainer: Alex Indigo <iam@alexindigo.com>

pkgname=qt6-mangowcqml
_projname=mangowcqml
pkgver=0.1.0
pkgrel=1
pkgdesc="Qt6/QML module for mangowc IPC (mmsg JSON socket) — workspaces, windows, monitors, tags"
options=(!debug)
arch=('x86_64' 'aarch64')
url="https://github.com/alexindigo/mangowcqml"
license=('LGPL-3.0-only')
depends=('qt6-base' 'qt6-declarative')
makedepends=('cmake')
provides=()
conflicts=('qt6-mangowcqml-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1e92e9ec4e7b274b2c0a4e28ee377cc08c026f1c364d6e1a66b62576578dc7b8')

build() {
    cmake -B build -S "${srcdir}/${_projname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
