# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=qtcreator-qodeassist-plugin
pkgver=0.7.0
_qtcreatorver=17.0.0
pkgrel=1
pkgdesc="QodeAssist is an AI-powered coding assistant plugin for Qt Creator v$_qtcreatorver"
groups=('qt')
arch=('x86_64')
url="https://github.com/Palm1r/QodeAssist"
license=('GPL-3.0-only')
provides=('qodeassist' 'QodeAssist')
conflicts=('qodeassist' 'QodeAssist')
depends=("qtcreator>=$_qtcreatorver")
makedepends=('cmake' "qtcreator-devel>=$_qtcreatorver")
source=("$pkgname-$pkgver.tar.gzr::${url}/archive/v$pkgver.tar.gz")
sha256sums=('45ae2e697dc237831f37d2ada885c630caa15d6078c5278e7df5176126d38410')

build() {
    cmake -S QodeAssist-$pkgver -B build \
        -Wno-dev \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_PREFIX_PATH="/usr/lib/cmake/Qt6"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
