# Maintainer: Ephemeral <theepehemral.txt@gmail.com>

# shellcheck disable=SC2034
pkgname=rong
pkgver=3.0.0
pkgrel=1
pkgdesc="A Material You and Base16 color generator"
arch=('x86_64')
url="https://github.com/Nadim147c/rong"
license=('GPL-3.0-only')
makedepends=('go')
provides=("$pkgname")
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=("glibc" "ffmpeg")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('447ca1a2d42b6ee32a617ff5226810f975268a99276431e00922e5c0ac4e7823')

build() {
    cd "$srcdir/${pkgname}-${pkgver}" || exit
    make build generate-completion VERSION="$pkgver"
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}" || exit
    make install PREFIX="$pkgdir/usr/"
}
