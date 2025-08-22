# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=qtcreator-qodeassist-plugin
pkgver=0.6.1
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
sha256sums=('44da10b4456312728da5c7dec68f11281783203b02c7b67b81552536c7955de5')

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
