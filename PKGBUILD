# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=qtcreator-qodeassist-plugin
pkgver=0.6.0
pkgrel=1
pkgdesc="QodeAssist is an AI-powered coding assistant plugin for Qt Creator "
groups=('qt')
arch=('x86_64')
url="https://github.com/Palm1r/QodeAssist"
license=('GPL-3.0-only')
depends=('qtcreator>=17.0.0')
makedepends=('cmake' 'qtcreator-devel>=17.0.0')
source=("$pkgname-$pkgver.tar.gzr::${url}/archive/v$pkgver.tar.gz")
sha256sums=('05fbced2af8ff15768dea15e1010c02faa52f87e485718bee0327ebcfd40bf3e')

build() {
    cmake \
        -S QodeAssist-$pkgver -B build \
        -Wno-dev \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_PREFIX_PATH="/usr/lib/cmake/Qt6"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
