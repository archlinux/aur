# Maintainer:  Rility <rility3 AT GMAIL>
# Contributor: LinRs <LinRs AT users.noreply.github.com>
# Contributor: Lucas Saliés Brum <lucas@archlinux.com.br>
pkgname=mtn
pkgver=3.5.0
pkgrel=1
pkgdesc="Movie Thumbnailer using FFmpeg forked from mtn2008"
arch=('x86_64')
url="https://gitlab.com/movie_thumbnailer/mtn"
license=('GPL2')
depends=('ffmpeg' 'gd')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-git")
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('0354e598dcbd3b7ac7f44e6c8b77699c5c7b51691b23e711513d785c3af06933')

build() {
    cd "${pkgname}-v${pkgver}/src"
    make
}
package() {
    cd "${pkgname}-v${pkgver}/src"
    make DESTDIR="$pkgdir/" PREFIX="/usr"  install
}
