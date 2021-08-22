# Maintainer: Dakeryas <mrdakeryas at gmail dot com>
pkgname=deadbeef-dr-meter-gtk3-git
pkgver=r245.2b6d99f
pkgrel=1
epoch=
pkgdesc="Dynamic Range meter plugin for the GTK3 DeaDBeeF audio player (devel)"
arch=('i686' 'x86_64')
url="https://github.com/dakeryas/deadbeef-dr-meter"
license=('Apache')
depends=('deadbeef' 'gtk3')
makedepends=('git' 'pkg-config')
provides=('deadbeef-dr-meter')
conflicts=('deadbeef-dr-meter')
source=("git+https://github.com/dakeryas/deadbeef-dr-meter.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/deadbeef-dr-meter"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/deadbeef-dr-meter"
    make
}

package() {
    cd "$srcdir/deadbeef-dr-meter"
    make DESTDIR="$pkgdir/" PREFIX=/usr/lib/deadbeef install
}
