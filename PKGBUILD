# Maintainer: fs4000 <matthias_dienstbier[at]yahoo[dot]de>

pkgname=libchipcard
pkgver=5.0.2
pkgrel=1
pkgdesc="A library for easy access to chip cards via chip card readers"
arch=('i686' 'x86_64')
url="http://www.libchipcard.de/"
license=('GPL2')
depends=('gwenhywfar' 'pcsclite')
options=('!libtool')
source=("libchipcard-$pkgver.tar.gz::http://www.aquamaniac.de/sites/download/download.php?package=02&release=26&file=01&dummy=libchipcard-5.0.2.tar.gz")
sha256sums=('d0968594c8ed0fc4cb6d681a74a5f000b48b0ac7a9375648b57d397ac49c1808')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    	--disable-static
    make
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    make -k check
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
