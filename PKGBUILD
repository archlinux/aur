# Submitter: katoh <katoh_at_mikage.ne.jp>
#

pkgname=azpainter
pkgver=3.0.10
pkgrel=1
pkgdesc='Painting software'
arch=('i686' 'x86_64')
url='http://azsky2.html.xdomain.jp/soft/azpainter.html'
license=('GPL3')
depends=('hicolor-icon-theme' 'fontconfig' 'libjpeg-turbo' 'libxi' 'libxcursor' 'libwebp')
makedepends=('ninja')
options=('!makeflags')
source=("https://gitlab.com/azelpg/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha256sums=('1804f8894fd2c3441d4316be309742f7eddb7afbb683020a988c8ddc7c84cb9c')


build() {
    cd "${pkgname}-v${pkgver}"
    ./configure --prefix=/usr
    cd build
    ninja
}

package() {
    cd "${pkgname}-v${pkgver}"
    cd build
    DESTDIR="${pkgdir}" ninja install
}
