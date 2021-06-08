# Submitter: katoh <katoh_at_mikage.ne.jp>
#

pkgname=azpainter
pkgver=3.0.1
pkgrel=1
pkgdesc='Painting software'
arch=('i686' 'x86_64')
url='http://azsky2.html.xdomain.jp/soft/azpainter.html'
license=('GPL3')
depends=('hicolor-icon-theme' 'fontconfig' 'libjpeg-turbo' 'libxi' 'libxcursor' 'libwebp')
options=('!makeflags')
source=(http://azsky2.html.xdomain.jp/arc/azpainter-3.0.1.tar.xz)
sha256sums=('990658c5ac54b08c14796d593a870f8d26c27d13b8a8c7224a4e0c7ff0182a37')


build() {
    cd ${pkgname}-${pkgver}
    ./configure --prefix=/usr
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install
}

