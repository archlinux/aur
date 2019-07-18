# Maintainer: killruana <killruana@gmail.com>
pkgname=qrouter
pkgver=1.4.59
pkgrel=1
epoch=
pkgdesc='Multi-level, over-the-cell maze router'
arch=('i686' 'x86_64')
url='http://opencircuitdesign.com/qrouter/'
license=('GPL')
depends=('tk')
source=("${url}/archive/${pkgname}-${pkgver}.tgz")
sha512sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --with-libdir=/usr/share/qrouter
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
