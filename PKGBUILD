# Maintainer:  Rility <rility3 AT GMAIL>
# Contributor: LinRs <LinRs AT users.noreply.github.com>
# Contributor: Lucas Saliés Brum <lucas@archlinux.com.br>
pkgname=mtn
pkgver=3.4.2
pkgrel=1
pkgdesc="Movie Thumbnailer using FFmpeg forked from mtn2008"
arch=('x86_64')
url="https://gitlab.com/movie_thumbnailer/mtn"
license=('GPL2')
depends=('ffmpeg' 'gd')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-git")
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('19b2076c00f5b0ad70c2467189b17f335c6e7ece5d1a01ed8910779f6a5ca52a')

build() {
    cd "${pkgname}-v${pkgver}/src"
    make
}
package() {
    cd "${pkgname}-v${pkgver}/src"
    make DESTDIR="$pkgdir/" PREFIX="/usr"  install
}
