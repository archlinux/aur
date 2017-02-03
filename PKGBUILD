# Maintainer: Timothy Rice <timothy.rice@unimelb.edu.au>

pkgname=datamash
pkgver=1.1.1
pkgrel=1
pkgdesc="A command-line program which performs numeric, textual and statistical operations on plain text data."
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/datamash/"
license=("GPL")
depends=('glibc')
source=("https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.sig})

sha256sums=('420819b3d7372ee3ce704add847cff7d08c4f8176c1d48735d4a632410bb801b'
            'SKIP')

validpgpkeys=('F576AAAC1B0FF849792D8CB129A794FD2272BC86')

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
