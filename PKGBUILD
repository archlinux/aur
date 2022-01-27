# Maintainer: André Kugland <kugland at gmail dot com>

pkgname=fastrandom
pkgver=1.0.4
pkgrel=1
pkgdesc="Quickly generate large amounts of cryptographically insecure
pseudo-random data"
arch=("x86_64")
url="https://gitlab.com/kugland/fastrandom"
license=("MIT")
source=(
    "https://gitlab.com/kugland/fastrandom/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"
)
sha256sums=('7c036d3bbe05b89399e3e129419fdc01c89ce3417aaea71612a9a243bba2873b')

package() {
    cd "${pkgname}-v${pkgver}"
    LDFLAGS="$LDFLAGS -Wl,--no-as-needed"
    make DESTDIR="$pkgdir" install
}
