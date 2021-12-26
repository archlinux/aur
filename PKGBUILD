# Submitter: katoh <katoh_at_mikage.ne.jp>
#

pkgname=azpainter
pkgver=3.0.4
pkgrel=1
pkgdesc='Painting software'
arch=('i686' 'x86_64')
url='http://azsky2.html.xdomain.jp/soft/azpainter.html'
license=('GPL3')
depends=('hicolor-icon-theme' 'fontconfig' 'libjpeg-turbo' 'libxi' 'libxcursor' 'libwebp')
options=('!makeflags')
source=("https://gitlab.com/azelpg/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha256sums=('a3c8382adf3b64fe0c825fd56075286a0e4e27e4172fe5617167955f13bee6a5')


build() {
    cd ${pkgname}-v${pkgver}
    ./configure --prefix=/usr
    make
}

package() {
    cd ${pkgname}-v${pkgver}
    make DESTDIR=${pkgdir} install
}

