pkgname="fastrandom"
pkgver="1.0.1"
pkgrel="1"
pkgdesc="Quickly generate large amounts of cryptographically insecure
pseudo-random data"
arch=("x86_64")
url="https://gitlab.com/kugland/fastrandom"
license=("MIT")
source=(
    "https://gitlab.com/kugland/fastrandom/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"
)
sha256sums=('5453e07d52d32e28dd142363ad70523384ea91bc91ad1893b5a9f8f7e13df382')

package() {
    cd "${pkgname}-v${pkgver}"
    LDFLAGS="$LDFLAGS -Wl,--no-as-needed"
    make DESTDIR="$pkgdir" install
}
