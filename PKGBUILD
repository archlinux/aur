# Maintainer: Ephemeral <theepehemral.txt@gmail.com>

# shellcheck disable=SC2034
pkgname=waybar-lyric
pkgver=0.13.1
pkgrel=1
pkgdesc="A waybar module for song lyric"
arch=('x86_64')
url="https://github.com/Nadim147c/waybar-lyric"
license=('AGPL-3.0-only')
makedepends=('go')
provides=("$pkgname")
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=("glibc")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2e37352c1f54407dfee748f7cd0d00dde54d793ab8d85fbf54efc423fe184e98')

build() {
    cd "$srcdir/${pkgname}-${pkgver}" || exit
    make VERSION="$pkgver"
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}" || exit
    make install PREFIX="$pkgdir/usr/"
}
