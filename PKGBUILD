# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=routino
pkgver=3.1.1
pkgrel=3
pkgdesc='Router for OpenStreetMap Data'
arch=('x86_64')
url='http://www.routino.org/'
license=('AGPL3')
depends=('zlib' 'bzip2')
source=("http://www.routino.org/download/$pkgname-$pkgver.tgz")
sha256sums=('23b9fce43f0a85c9efe220c6c72026dd7b37f6a4a5153bb9dc4c4b0747c7f282')

prepare() {
    cd "$pkgname-$pkgver"

    sed -i 's|prefix=/usr/local|prefix=/usr|' Makefile.conf
}

build() {
    cd "$pkgname-$pkgver"

    make
}

package() {
    cd "$pkgname-$pkgver"

    make DESTDIR="${pkgdir}" install
    mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
