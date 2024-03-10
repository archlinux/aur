# Maintainer: NagiNikaido <naginikaido@foxmail.com>

pkgname=interception-fnkeys-xiaoxin
pkgver=0.1.0
pkgrel=1
pkgdesc="An Interception tools plugin fixing failed Fn-key mappings on latest Lenovo XiaoXin series."
arch=('x86_64')
url="https://github.com/NagiNikaido/Fix-Fnkeys-XiaoXin"
license=('MIT')
depends=('interception-tools')
makedepends=('cmake' 'gcc')

source=("https://github.com/NagiNikaido/Fix-Fnkeys-XiaoXin/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('07909cb2142ae9d4ee573632ebbadb90f0d728cf54329f0873fec0685aa46575')
_reponame=Fix-Fnkeys-XiaoXin

build() {
    cd ${srcdir}/${_reponame}-${pkgver}
    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd ${srcdir}/${_reponame}-${pkgver}/build

    make DESTDIR="$pkgdir/" install
}
