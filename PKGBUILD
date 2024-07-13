# Submitter: katoh <katoh_at_mikage.ne.jp>
#

pkgname=azpainter
pkgver=3.0.8
pkgrel=1
pkgdesc='Painting software'
arch=('i686' 'x86_64')
url='http://azsky2.html.xdomain.jp/soft/azpainter.html'
license=('GPL3')
depends=('hicolor-icon-theme' 'fontconfig' 'libjpeg-turbo' 'libxi' 'libxcursor' 'libwebp')
makedepends=('ninja')
options=('!makeflags')
source=("https://gitlab.com/azelpg/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha256sums=('c5af10bd3a94c3997d2f9860af3816e9fd799eeb89436a3f996c741e357b1c43')


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

