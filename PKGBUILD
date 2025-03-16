# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=sf-down-git
pkgver=r13.b938130
pkgrel=2
pkgdesc="Allows you to download all of a SourceForge project's files"
arch=(any)
license=(unknown)
url="https://github.com/SpiritQuaddicted/sourceforge-file-download"
depends=(bash wget)
makedepends=(git)
conflicts=(sf-down)
provides=(sf-down)
source=("${pkgname}::git+https://github.com/SpiritQuaddicted/sourceforge-file-download.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 sourceforge-file-downloader.sh "${pkgdir}/usr/bin/sf-down"
}
