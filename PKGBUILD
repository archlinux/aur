# Maintainer: Ken Miller <kenneth.millr@gmail.com>
# Contributor: fs4000 <matthias_dienstbier[at]yahoo[dot]de>

pkgname=libchipcard
pkgver=5.1.6
pkgrel=1
pkgdesc="A library for easy access to chip cards via chip card readers"
arch=('i686' 'x86_64')
url="http://www.libchipcard.de/"
license=('GPL2')
depends=('gwenhywfar' 'pcsclite')
source=("$pkgname-$pkgver.tar.gz::https://www.aquamaniac.de/rdm/attachments/download/382/$pkgname-$pkgver.tar.gz")
sha256sums=('6c07f527417f7562074f99012da4d11eb4dbafd33f49e66b442ccd6e3b8cfd20')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
    make
}

check() {
    cd $pkgname-$pkgver
    make -k check
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
