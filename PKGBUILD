# Maintainer: hendrikcech <hendrik.cech@gmail.com>
# Co-Maintainer: Marek Küthe <m.k@mk16.de>
# Contributor: Spider.007 <archPackage@spider007.net>

pkgname=scamper
pkgver=20251002
pkgrel=1
pkgdesc="a tool that actively probes the Internet in order to analyze topology and performance"
url="https://www.caida.org/catalog/software/scamper/"
source=("https://www.caida.org/catalog/software/scamper/code/$pkgname-cvs-$pkgver.tar.gz")
sha256sums=('8487c6c915dee110f028d55abb1e19ff773449a220eda6a94f33dfdd7c46464c')
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
