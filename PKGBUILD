# Maintainer: fishnpotatoes <me@fishies.dev>
pkgname=dbus-send-json
pkgver=0.1.0
pkgrel=1
pkgdesc="A modification of dbus-send to print replies in JSON"
arch=('i686' 'x86_64')
url="https://codeberg.org/fishn/dbus-send-json"
license=('GPL')
groups=('base-devel')
depends=('dbus')
makedepends=('meson')
source=("https://codeberg.org/fishn/dbus-send-json/archive/0.1.0.tar.gz")
sha256sums=('2c2d3fb4d4ce48b59ae25e9a4574a4f9b01b0e76ea5e2d9c01952587a1c3838d')

build() {
    cd $pkgname

    meson setup --reconfigure buildDir || exit 1
    cd buildDir || exit 1
    meson compile
}

package() {
    cd $pkgname/buildDir
    meson install --destdir="$pkgdir"
}
