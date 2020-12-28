pkgname=kytea
pkgver=0.4.7
pkgrel=1
pkgdesc="The Kyoto Text Analysis Toolkit for word segmentation and pronunciation estimation, etc."
arch=('i686' 'x86_64')
url="http://www.phontron.com/kytea"
license=('Apache-2.0')
source=("http://www.phontron.com/kytea/download/kytea-${pkgver}.tar.gz")
builddepends=(gcc)

build() {
    cd $srcdir/$pkgname-$pkgver
    ./configure --prefix=/usr \
    --localstatedir=/var \
    --sysconfdir=/etc \
    --sbindir=/usr/bin

    make
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}

sha1sums=('684f6b90bd4ae048ea3a6fc9762b1baecb006eb3')
sha256sums=('534a33d40c4dc5421f053c71a75695c377df737169f965573175df5d2cff9f46')
