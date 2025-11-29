# Maintainer: Ephemeral <theepehemral.txt@gmail.com>

# shellcheck disable=SC2034
pkgname=rong
pkgver=3.2.0
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
sha256sums=('516992ceecd7055ebd68e1f15e953bc189439158940d41abec156d641aeed9cc')

build() {
    cd "$srcdir/${pkgname}-${pkgver}" || exit
    make build generate-completion VERSION="$pkgver"
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}" || exit
    make install PREFIX="$pkgdir/usr/"
}
