# Submitter: katoh <katoh_at_mikage.ne.jp>
#

pkgname=azpainter
pkgver=3.0.1
pkgrel=2
pkgdesc='Painting software'
arch=('i686' 'x86_64')
url='http://azsky2.html.xdomain.jp/soft/azpainter.html'
license=('GPL3')
depends=('hicolor-icon-theme' 'fontconfig' 'libjpeg-turbo' 'libxi' 'libxcursor' 'libwebp')
options=('!makeflags')
source=("https://gitlab.com/azelpg/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha256sums=('0ab0e21bf2d62b60f3448436fb3441c2ca8e022a92eef5c63fdef116799dcedc')


build() {
    cd ${pkgname}-v${pkgver}
    ./configure --prefix=/usr
    make
}

package() {
    cd ${pkgname}-v${pkgver}
    make DESTDIR=${pkgdir} install
}

