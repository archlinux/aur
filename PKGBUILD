# Maintainer: Papangkorn Apinyanon <dev@papangkorn.com>
pkgname=sdraw
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple painting program"
arch=('x86_64')
url="https://codeberg.org/sleepntsheep/sdraw"
license=('GPL3')
groups=()
depends=('sdl2' 'sdl2_ttf')
makedepends=( 'autoconf' 'automake' 'make' )
optdepends=()
provides=('sdraw')
conflicts=('sdraw')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://codeberg.org/sleepntsheep/sdraw/archive/$pkgver.tar.gz")
noextract=()
md5sums=('SKIP')

build() {
    cd "$pkgname/"

    autoreconf -fi
    ./configure --prefix=/usr
}

package() {
    cd "$pkgname/"
    make DESTDIR="$pkgdir" install
    desktop-file-install --dir=$HOME/.local/share/applications sdraw.desktop
}

