# Contributor: William Gathoye <william + aur at gathoye dot be>

pkgname=dh-exec
pkgver=0.30
pkgrel=1
pkgdesc='Debhelper executable file substition helpers'
arch=('x86_64')
url='https://salsa.debian.org/debian/dh-exec'
license=('GPL-3.0-or-later')
depends=('libpipeline')
optdepends=('debhelper: required for runtime')
source=("https://salsa.debian.org/debian/${pkgname}/-/archive/${pkgname}-${pkgver}/${pkgname}-${pkgname}-${pkgver}.tar.gz")
sha512sums=('56c6e0ca01e5142a3a28e266e1aa134e6987ba2afc44b77e4d175db2bec5eccf85755def3375a254751d982c88c6587c4cfc9fcb7dfe9c7f661b1692de7eb870')

build() {
    cd "${pkgname}-${pkgname}-${pkgver}"
    autoreconf --install
    ./configure --prefix=/usr --libexecdir=/usr/lib
    make
}

package() {
    cd "${pkgname}-${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
