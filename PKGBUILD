# Submitter: katoh <katoh_at_mikage.ne.jp>
#

pkgname=azpainter
pkgver=3.0.3
pkgrel=1
pkgdesc='Painting software'
arch=('i686' 'x86_64')
url='http://azsky2.html.xdomain.jp/soft/azpainter.html'
license=('GPL3')
depends=('hicolor-icon-theme' 'fontconfig' 'libjpeg-turbo' 'libxi' 'libxcursor' 'libwebp')
options=('!makeflags')
source=("https://gitlab.com/azelpg/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha256sums=('1106d3c95e204347dc7f7043e12ca0355d6a9425d53317f230f2b9734f4b73f8')


build() {
    cd ${pkgname}-v${pkgver}
    ./configure --prefix=/usr
    make
}

package() {
    cd ${pkgname}-v${pkgver}
    make DESTDIR=${pkgdir} install
}

