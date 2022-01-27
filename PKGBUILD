# Maintainer: André Kugland <kugland at gmail dot com>

pkgname="fastrandom"
pkgver="1.0.2"
pkgrel="1"
pkgdesc="Quickly generate large amounts of cryptographically insecure
pseudo-random data"
arch=("x86_64")
url="https://gitlab.com/kugland/fastrandom"
license=("MIT")
source=(
    "https://gitlab.com/kugland/fastrandom/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"
)
sha256sums=('226175b569c3e5adf94b18f83d37b70a3ab3abb44da8455cf16a3bea23862dcc')

package() {
    cd "${pkgname}-v${pkgver}"
    LDFLAGS="$LDFLAGS -Wl,--no-as-needed"
    make DESTDIR="$pkgdir" install
}
