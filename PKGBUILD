# Maintainer: Timothy Rice <t.rice@ms.unimelb.edu.au>

pkgname=datamash
pkgver=1.1.0
pkgrel=1
pkgdesc="A command-line program which performs numeric, textual and statistical operations on plain text data."
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/datamash/"
license=("GPL")
depends=('glibc')
source=("http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz")

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

check() {
    cd "$pkgname-$pkgver"
    make check
}

package() {
    cd "$pkgname-$pkgver/"
    make DESTDIR="$pkgdir/" install
}
md5sums=('79a6affca08107a095e97e4237fc8775')
