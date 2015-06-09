# Maintainer: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Yenting Chen <coolcyt@gmail.com>
# Contributor: Lyman Li <lymanrb@gmail.com>

pkgname=pcmanx-gtk2
pkgver=1.2
pkgrel=2
pkgdesc="A gtk+ based free BBS client"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pcmanx-gtk2"
license=('GPL')
depends=('gtk2' 'libltdl')
optdepends=('wget')
makedepends=('autoconf' 'automake' 'intltool' 'pkg-config')
options=('!libtool')
source=(http://pcmanx-gtk2.googlecode.com/files/${pkgname}-${pkgver}.tar.xz
    pcmanx.install)
md5sums=('035d6743f2844db9488166536b186e91'
    '6374916400684c2db957be0250a4ca98')
install=pcmanx.install

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr --enable-wget --enable-iplookup || return 1
    make || return 1
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install || return 1
}
