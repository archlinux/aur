# Maintainer Marcel Kleinfeller <marcel@oompf.de>

pkgname="coda"
pkgver=6.9.6
pkgrel=1
pkgdesc="A distributed file system with disconnected operation."

## TODO: Include Dependencies

arch=("i868" "x86_64" "armv7h")
url="http://coda.cs.cmu.edu/"
source=("http://coda.cs.cmu.edu/coda/source/coda-6.9.6.tar.xz")
sha512sums=("0c425846c2ff3d425554472f8f09cc9af11fc3d2749a006a2bc0132abcf3ac10964593ca7a42f8a1a94a404dcc6753afc922a0f79df8a519b5dd1655959f4ab6")
license=("GPL")

build() {
    cd "${srcdir}/coda-6.9.6"
    ./bootstrap.sh
    ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin --libdir=/usr/lib \
    --datadir=/usr/share --includedir=/usr/include --with-lua
    make
}

package() {
    cd "${srcdir}/coda-6.9.6"
    make DESTDIR="${pkgdir}" install
}
