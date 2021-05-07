# Maintainer: lotation <xlapsiu@gmail.com>
# Contributor: Matteo Iervasi <matteoiervasi@gmail.com>
# Contributor: Joshua Chapman <john.chy99@gmail.com>

pkgname=sis
pkgver=1.4
pkgrel=1
pkgdesc="Legacy Logic Synthesis Software"
arch=('i686' 'x86_64')
url="https://github.com/JackHack96/logic-synthesis"
license=('BSD')
depends=('readline')
makedepends=('gcc8')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip' '!emptydirs')
source=("https://github.com/JackHack96/logic-synthesis/archive/SIS.tar.gz")
sha256sums=('SKIP')

build() {
    cd "logic-synthesis-SIS"

    autoreconf -f -i
    ./configure CXX=g++-8 CC=gcc-8 --prefix=/usr
    make CXX=g++-8 CC=gcc-8
}

package() {
    cd "logic-synthesis-SIS"

    make DESTDIR="$pkgdir" install

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}