#Maintainer: Illia Shestakov <illia@ishestakov.com>

pkgname=ncdu2
pkgver=2.0.1
_pkgver=${pkgver/beta/-beta}
pkgrel=1
pkgdesc="Disk usage analyzer with an ncurses interface. Rewrite in Zig."
arch=("i686" "x86_64")
url="https://dev.yorhel.nl/ncdu"
license=('MIT')
depends=("ncurses")
makedepends=("zig" "make")
source=("https://dev.yorhel.nl/download/ncdu-${_pkgver}.tar.gz")
sha512sums=("853bb74fe7d896ef3d3ff02366f4e7f98e3833ef5f7fe0239a5e8225052592e210974e7b4a8feb4c41783c05bf2c0c0ac448ef1fcde7b7d0a7092386ebadbad4")

build() {
    cd "${srcdir}/ncdu-${_pkgver}"

    make
}

package() {
    cd "${srcdir}/ncdu-${_pkgver}"

    install -Dm755 zig-out/bin/ncdu "${pkgdir}/usr/bin/ncdu2"
}
