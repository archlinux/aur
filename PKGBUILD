# Maintainer: hendrikcech <hendrik.cech@gmail.com>
# Co-Maintainer: Marek Küthe <m.k@mk16.de>
# Contributor: Spider.007 <archPackage@spider007.net>

pkgname=scamper
pkgver=20240122
pkgrel=1
pkgdesc="a tool that actively probes the Internet in order to analyze topology and performance"
url="https://www.caida.org/catalog/software/scamper/"
source=("https://www.caida.org/catalog/software/scamper/code/$pkgname-cvs-$pkgver.tar.gz")
sha512sums=('a2def6cfab09752f54c65837855f74c9de8ba4585e6f355acf142cc2f60ba1ebd8e3ea4fb23132e1a162e25c62f5f3bb9950ccff4876ef4c9a90dc0a3ef6ce3c')
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
