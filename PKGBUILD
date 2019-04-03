# Maintainer: LinRs <LinRs AT users.noreply.github.com>
# Contributor: Lucas Saliés Brum <lucas@archlinux.com.br>
pkgname=mtn
pkgver=3.3.1
pkgrel=1
pkgdesc="Movie Thumbnailer using FFmpeg forked from mtn2008"
arch=('x86_64')
url="https://gitlab.com/movie_thumbnailer/mtn"
license=('GPL2')
depends=('ffmpeg' 'gd')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-git")
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('137c53ef4ba3fc905e6dd5a1bdbbb029a3012c726c3e30bae329fc81f8e7fe57')

build() {
    cd "${pkgname}-${pkgver}/src"
    make
}
package() {
    cd "${pkgname}-${pkgver}/src"
    make DESTDIR="$pkgdir/" install
}
