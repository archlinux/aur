# Maintainer: killruana <killruana@gmail.com>
pkgname=qrouter
pkgver=1.2.35
pkgrel=1
epoch=
pkgdesc='Multi-level, over-the-cell maze router'
arch=('i686' 'x86_64')
url='http://opencircuitdesign.com/qrouter/'
license=('GPL')
depends=('tk' 'libxt')
source=("${url}/archive/${pkgname}-${pkgver}.tgz")
sha512sums=('0f484ea3c19019730805beefbf9e97cceceaba8c662413a63f6d234c7f90853015504d4e456be77016d92325d1ffd1041d677519d6c2332ed5f6ab3ba2fdaeb7')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    #sed -i 's@/usr/local/share/qrouter@/usr/bin/qrouter@g' Makefile
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
