# Maintainer: fenuks

_pkgname=gnoMint
pkgname=gnomint
pkgver=1.3.0
pkgrel=3
pkgdesc="Certification Authority management made easy."
arch=("i686" "x86_64")
url="http://gnomint.sf.net"
license=("GPL3")
depends=("gconf" "gtk2" "sqlite")
optdepends=()
makedepends=("autoconf" "intltool")  
conflicts=("${pkgname}")
options=("!buildflags")
# install=$pkgname.install
source=("gnomint-${pkgver}.tar.gz::https://github.com/davefx/gnoMint/archive/1.3.0.tar.gz")
md5sums=('a02c57c0bcc2d714b8034d264bc46afc')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./autogen.sh --prefix=/usr
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make install DESTDIR="$pkgdir"
    cd "${pkgdir}"
    mv usr/etc .
}
