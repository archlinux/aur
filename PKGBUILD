# Maintainer:  Rility <rility3 AT GMAIL>
# Contributor: LinRs <LinRs AT users.noreply.github.com>
# Contributor: Lucas Saliés Brum <lucas@archlinux.com.br>
pkgname=mtn
pkgver=3.4.0
pkgrel=1
pkgdesc="Movie Thumbnailer using FFmpeg forked from mtn2008"
arch=('x86_64')
url="https://gitlab.com/movie_thumbnailer/mtn"
license=('GPL2')
depends=('ffmpeg' 'gd')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-git")
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('e9509953f0a0c1eaba7e2fe96283970a209deb54143ff8a16103e13d3f74e5a3')

build() {
    cd "${pkgname}-v${pkgver}/src"
    make
}
package() {
    cd "${pkgname}-v${pkgver}/src"
    make DESTDIR="$pkgdir/" PREFIX="/usr"  install
}
