# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Denis Kobozev <d.v.kobozev at gmail dot com>
# Package Repository: https://github.com/mij-aur-packages/xapian-omega

pkgname=xapian-omega
pkgver=1.2.21
pkgrel=1
pkgdesc="Indexers and CGI search frontend for Xapian"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="http://www.xapian.org/"
license=('GPL')
depends=('xapian-core' 'perl' 'pcre')
source=(http://oligarchy.co.uk/xapian/${pkgver}/${pkgname}-${pkgver}.tar.xz)
sha256sums=('862d3a5d7052fc13c16eed51c42d774c4ab1c56967c477d994995b753dc9527e')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR=${pkgdir} install
}

