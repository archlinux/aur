# Maintainer: Ephemeral <theepehemral.txt@gmail.com>

# shellcheck disable=SC2034
pkgname=waybar-lyric
pkgver=0.14.1
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
sha256sums=('a2ac97e1d9d830744757988404acc10e3d92f679c6d96ab2dd6ae82def84e14f')

build() {
    cd "$srcdir/${pkgname}-${pkgver}" || exit
    make VERSION="$pkgver"
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}" || exit
    make install PREFIX="$pkgdir/usr/"
}
