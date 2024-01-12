# Maintainer: taotieren <admin@taotieren.com>

pkgname=canboat
pkgver=5.0.3
pkgrel=0
epoch=
pkgdesc="CAN Boat provides NMEA 2000 and NMEA 0183 utilities. It contains a NMEA 2000 PGN decoder and can read and write N2K messages. It is not meant as an end-user tool but as a discovery mechanism for delving into NMEA 2000 networks."
arch=(aarch64
    riscv64
    x86_64)
url="https://github.com/canboat/canboat"
license=('MIT')
groups=()
depends=(glibc)
# makedepends=(help2man)
checkdepends=()
optdepends=()
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('b095726ec4d7225ff10d13bbf2c9df68b6f82067128892f50a9ca845a55882b2')
#validpgpkeys=()

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX=/usr
}

# check() {
#     cd "${srcdir}/${pkgname}-${pkgver}"
#     make PREFIX=/usr tests
# }

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
