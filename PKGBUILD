# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Denis Kobozev <d.v.kobozev at gmail dot com>
# Package Repository: https://github.com/mij-aur-packages/xapian-omega

pkgname=xapian-omega
pkgver=1.4.14
pkgrel=1
pkgdesc="Indexers and CGI search frontend for Xapian"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="http://www.xapian.org/"
license=('GPL')
depends=('xapian-core' 'perl' 'pcre')
source=(http://oligarchy.co.uk/xapian/${pkgver}/${pkgname}-${pkgver}.tar.xz)
sha256sums=('8b2b16cd52409c35507d1103cbdf10d9eabd0b5df64d9f34f0c9065a5d0286c3')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR=${pkgdir} install
}

