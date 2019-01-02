# Maintainer: Michael Taboada <michael@2mb.solutions>
_pkgname=${pkgname%-src}
pkgname=xidel-src
pkgver=0.9.8
pkgrel=3
pkgdesc='A command line tool to download and extract data from html/xml pages'
arch=('x86_64' 'i686' 'armv7h' 'arch64')
url='http://videlibri.sourceforge.net/xidel.html'
license=('GPL')
optdepends=('openssl: for HTTPS connections')
depends=('glibc')
makedepends=('fpc')
source=("${_pkgname}-${pkgver}.src.tar.gz::https://sourceforge.net/projects/videlibri/files/Xidel/Xidel%20${pkgver}/xidel-${pkgver}.src.tar.gz/download")
conflicts=('xidel')
provides=('xidel')
sha256sums=('72b5b1a2fc44a0a61831e268c45bc6a6c28e3533b5445151bfbdeaf1562af39c')

build() {
    cd "${srcdir}/xidel-${pkgver}-src/programs/internet/xidel"
    ./build.sh
}

package() {
    cd "${srcdir}/xidel-${pkgver}-src/programs/internet/xidel"
    install -D xidel "${pkgdir}/usr/bin/xidel"
}
