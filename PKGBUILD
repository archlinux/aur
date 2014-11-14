# Maintainer: Slash <demodevil5[at]yahoo[dot]com>

pkgname=xqf
pkgver=1.0.6.2
pkgrel=2
pkgdesc="A game server browser and launcher for Unix/X11 for many popular games (a qstat frontend)"
url="http://www.linuxgames.com/xqf/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2' 'qstat' 'geoip')
makedepends=('intltool')
conflicts=('xqf-cvs' 'xqf-svn' 'xqf-git')
source=("https://github.com/XQF/xqf/archive/xqf-${pkgver}.tar.gz")
sha256sums=('bcfb87c9a452993b13bd1019b0c61459a37cbc37b13b951b73f2a93b2b1c83ad')

build() {
    cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"

    ./autogen.sh --prefix=/usr
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"

    make DESTDIR="${pkgdir}" install

    # Remove empty directory
    rm -r "${pkgdir}/usr/libexec"
}

