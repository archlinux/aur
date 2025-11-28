# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=qtcreator-qodeassist-plugin
pkgver=0.9.2
pkgrel=1
pkgdesc="QodeAssist is an AI-powered coding assistant plugin for Qt Creator"
groups=('qt')
arch=('x86_64')
url="https://github.com/Palm1r/QodeAssist"
license=('GPL-3.0-only')
provides=('qodeassist' 'QodeAssist')
conflicts=('qodeassist' 'QodeAssist')
depends=("qtcreator-devel")
makedepends=('cmake' "qtcreator-devel")
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha256sums=('7a1c4e1f33f53880973e2045c700e0a12e01fe8568553f5030f454950b60a6b6')

build() {
    cmake -S QodeAssist-$pkgver -B build \
        -Wno-dev \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr'
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
