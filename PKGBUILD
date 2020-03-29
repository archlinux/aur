# Maintainer:  Rility <rility3 AT GMAIL>
# Contributor: LinRs <LinRs AT users.noreply.github.com>
# Contributor: Lucas Saliés Brum <lucas@archlinux.com.br>
pkgname=mtn
pkgver=3.3.3
pkgrel=1
pkgdesc="Movie Thumbnailer using FFmpeg forked from mtn2008"
arch=('x86_64')
url="https://gitlab.com/movie_thumbnailer/mtn"
license=('GPL2')
depends=('ffmpeg' 'gd')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-git")
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6fa12db08a636d2d3c34c1a73b029cbce397ef632fad2b4f75fe36137ac45391')

build() {
    cd "${pkgname}-${pkgver}/src"
    make
}
package() {
    cd "${pkgname}-${pkgver}/src"
    make DESTDIR="$pkgdir/" PREFIX="/usr"  install
}
