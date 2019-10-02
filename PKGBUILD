pkgname=xcdroast
pkgver=1.19
pkgrel=1
epoch=
pkgdesc="X-CD-Roast is a flexible frontend for optical disc authoring."
arch=('i686' 'x86_64' 'armv6h')
url="http://www.xcdroast.org"
license=('GPLv2')
depends=('cdrtools>=3.02a07')
source=("https://downloads.sourceforge.net/project/xcdroast/$pkgname-$pkgver.tar.gz")
md5sums=('435f178db53e14452e923cba6afbb687')

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

check() {
    cd "$pkgname-$pkgver"
    make -k check
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
