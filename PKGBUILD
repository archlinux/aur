# Maintainer:  Rility <rility3 AT GMAIL>
# Contributor: LinRs <LinRs AT users.noreply.github.com>
# Contributor: Lucas Saliés Brum <lucas@archlinux.com.br>
pkgname=mtn
pkgver=3.4.1
pkgrel=1
pkgdesc="Movie Thumbnailer using FFmpeg forked from mtn2008"
arch=('x86_64')
url="https://gitlab.com/movie_thumbnailer/mtn"
license=('GPL2')
depends=('ffmpeg' 'gd')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-git")
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('34c1105c67b29cc5f11c811bd8e9850eb8e80e421a6ff9bbdd11d37cb863d356')

build() {
    cd "${pkgname}-v${pkgver}/src"
    make
}
package() {
    cd "${pkgname}-v${pkgver}/src"
    make DESTDIR="$pkgdir/" PREFIX="/usr"  install
}
