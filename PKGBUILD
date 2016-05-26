# Maintainer: Johan Helsing <johan.helsing@gmail.com>
pkgname=wldbg-git
pkgver=0.2.0.r56.g1ae6591
pkgrel=1
pkgdesc='Tool for processing wayland connections'
arch=(i686 x86_64)
url='https://github.com/mchalupa/wldbg'
provides=()
license=('MIT')
depends=('wayland')
makedepends=('git')
source=(git://github.com/mchalupa/wldbg)
sha1sums=('SKIP')

pkgver() {
    cd wldbg
    git describe --long | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd wldbg
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd wldbg
    make DESTDIR="${pkgdir}" install
}
