# Submitter: katoh <katoh_at_mikage.ne.jp>
#

pkgname=azpainter
pkgver=3.0.2
pkgrel=1
pkgdesc='Painting software'
arch=('i686' 'x86_64')
url='http://azsky2.html.xdomain.jp/soft/azpainter.html'
license=('GPL3')
depends=('hicolor-icon-theme' 'fontconfig' 'libjpeg-turbo' 'libxi' 'libxcursor' 'libwebp')
options=('!makeflags')
source=("https://gitlab.com/azelpg/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha256sums=('526f96afb867a301b5a0fcc66759bc37c06a329522edb11235004f10f199f85b')


build() {
    cd ${pkgname}-v${pkgver}
    ./configure --prefix=/usr
    make
}

package() {
    cd ${pkgname}-v${pkgver}
    make DESTDIR=${pkgdir} install
}

