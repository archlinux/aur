# Maintainer: Ephemeral <theepehemral.txt@gmail.com>

# shellcheck disable=SC2034
pkgname=waybar-lyric
pkgver=0.13.2
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
sha256sums=('be6ab068051850b868fec338ed57fd750e8acdd0e4266cd770163338a74c5d0d')

build() {
    cd "$srcdir/${pkgname}-${pkgver}" || exit
    make VERSION="$pkgver"
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}" || exit
    make install PREFIX="$pkgdir/usr/"
}
