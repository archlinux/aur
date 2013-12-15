# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Denis Kobozev <d.v.kobozev at gmail dot com>

pkgname=xapian-omega
pkgver=1.2.16
pkgrel=1
pkgdesc="Indexers and CGI search frontend for Xapian"
arch=('i686' 'x86_64')
url="http://www.xapian.org/"
license=('GPL')
depends=('xapian-core' 'perl' 'pcre')
source=(http://oligarchy.co.uk/xapian/${pkgver}/${pkgname}-${pkgver}.tar.xz)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR=${pkgdir} install
}

md5sums=('57dbdcfd3008fe6394275a8de75292c2')
