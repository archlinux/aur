# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=sf-down
pkgname=${_pkgname}-git
pkgver=r9.a7cc380
pkgrel=1
pkgdesc="Allows you to download all of a SourceForge project's files"
arch=(any)
license=(unknown)
url="https://github.com/SpiritQuaddicted/sourceforge-file-download"
depends=(bash wget)
makedepends=(git)
provides=(sf-down)
conflicts=(sf-down)
source=("${pkgname}::git+https://github.com/SpiritQuaddicted/sourceforge-file-download.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${pkgname}"

    install -Dm755 sourceforge-file-downloader.sh "${pkgdir}/usr/bin/sf-down"
}
