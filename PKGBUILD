# Maintainer: Nikos Toutountzoglou <nikos.toutou@gmail.com>

pkgname=dreamchess
pkgver=0.3.0
pkgrel=1
pkgdesc="DreamChess is an open source chess game. It comes with its own engine called Dreamer."
arch=('i686' 'x86_64')
url="https://github.com/dreamchess/dreamchess"
license=('GPL3')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'expat' 'glew')
makedepends=('flex' 'bison' 'cmake')
provides=('dreamchess')
conflicts=('dreamchess')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b070a34acf69ed92e523902683d104abb295d78b6f37663f4668e929b9e90470')

build() {
        cd "$pkgname-$pkgver/cmake"
        cmake -DCMAKE_INSTALL_PREFIX=/usr ..
        make
}

package() {
        cd "$pkgname-$pkgver/cmake"
        make DESTDIR="$pkgdir/" install
}