# Maintainer: Ephemeral <theepehemral.txt@gmail.com>

# shellcheck disable=SC2034
_pkgname=waybar-lyric
pkgname=${_pkgname}-git
pkgver=0.6.1.r0.g3d82e2b
pkgrel=1
pkgdesc="Get lyrics of currently playling song on waybar"
arch=('x86_64')
url="https://github.com/Nadim147c/waybar-lyric"
license=('AGPL-3.0-only')
makedepends=('go' 'git')
depends=("glibc")
source=("${_pkgname}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}" || exit

    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${_pkgname}" || exit
    make
}

package() {
    cd "$srcdir/${_pkgname}" || exit
    make install PREFIX="$pkgdir/usr/"
}

