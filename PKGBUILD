# Maintainer: Nickid2018 <nickid2018@outlook.com>
_pkgname='minecraft-ping'
pkgname=minecraft-ping
pkgver=1.0.0
pkgrel=1
pkgdesc="A tool for pinging minecraft servers"
arch=('x86_64')
url="https://github.com/Nickid2018/minecraft-ping"
license=('MIT')
depends=('cjson')
makedepends=(cmake)
source=("https://github.com/Nickid2018/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('24b16745d49615446b7637bd48d656e537cc4641272c091059df7cf7a905de66')

build() {
    cmake -B build -S "$_pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE='None' \
	-DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}

