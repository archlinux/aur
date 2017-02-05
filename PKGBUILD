# Maintainer Marcel Kleinfeller <marcel@oompf.de>

pkgname="coda"
pkgver=6.11.1
pkgrel=1
pkgdesc="A distributed file system with disconnected operation."

## TODO: Include Dependencies

arch=("i868" "x86_64" "armv7h")
url="http://coda.cs.cmu.edu/"
source=("http://coda.cs.cmu.edu/coda/source/coda-6.11.1.tar.xz")
sha512sums=("6726edeb3253f79ed648adfd503d3c5001e0145100c6b63eb13c289ee54aeecd9eb2af3717675cdd35162ae7760a344efb42a09234a8efbc950338b8e3c170a5")
license=("GPL")

build() {
    cd "${srcdir}/coda-6.11.1"
    ./bootstrap.sh
    ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin --libdir=/usr/lib \
    --datadir=/usr/share --includedir=/usr/include --with-lua
    make
}

package() {
    cd "${srcdir}/coda-6.11.1"
    make DESTDIR="${pkgdir}" install
}
