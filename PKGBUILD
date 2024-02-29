# Maintainer: hendrikcech <hendrik.cech@gmail.com>
# Co-Maintainer: Marek Küthe <m.k@mk16.de>
# Contributor: Spider.007 <archPackage@spider007.net>

pkgname=scamper
pkgver=20240229
pkgrel=1
pkgdesc="a tool that actively probes the Internet in order to analyze topology and performance"
url="https://www.caida.org/catalog/software/scamper/"
source=("https://www.caida.org/catalog/software/scamper/code/$pkgname-cvs-$pkgver.tar.gz")
sha512sums=('52c0334a1ad2a857129a1a7577a2d1e845400ac2b11fa005c58361d2b975f6b7b603abb00eb5ec0a9530593d22fe148566fa2c168c357248f31093ce6b06e1b1')
depends=('openssl' 'zlib' 'bzip2' 'xz')
license=('GPL-2.0-or-later')
arch=('i686' 'x86_64')

build() {
    cd "$pkgname-cvs-$pkgver"

    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-cvs-$pkgver"

    make DESTDIR="$pkgdir/" install
    chmod u+s $pkgdir/usr/bin/scamper
}
