# Maintainer: André Kugland <kugland at gmail dot com>

pkgname=fastrandom
pkgver=1.0.3
pkgrel=1
pkgdesc="Quickly generate large amounts of cryptographically insecure
pseudo-random data"
arch=("x86_64")
url="https://gitlab.com/kugland/fastrandom"
license=("MIT")
source=(
    "https://gitlab.com/kugland/fastrandom/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"
)
sha256sums=('474a001f4f07628288810af0d5e60809320f98b84d384f3f4eb329f6293c93d6')

package() {
    cd "${pkgname}-v${pkgver}"
    LDFLAGS="$LDFLAGS -Wl,--no-as-needed"
    make DESTDIR="$pkgdir" install
}
