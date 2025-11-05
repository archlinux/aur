# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=qtcreator-qodeassist-plugin
pkgver=0.8.1
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
source=("$pkgname-$pkgver.tar.gzr::${url}/archive/v$pkgver.tar.gz")
sha256sums=('d33aa98617c76d0946aaf461765982aeb0971aaa2ec66484f7b909913b1ead2a')

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
