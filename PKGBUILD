# Maintainer: Michal Babik <michalb1981@o2.pl>

pkgname=sfrename
pkgver=1.2.9
pkgrel=1
pkgdesc="Program for renaming files and directories"
arch=('i686' 'x86_64')
url="https://www.nongnu.org/small-file-renamer/"
license=('GPL3')
depends=('gtk3>=3.22.0')
source=("https://download.savannah.nongnu.org/releases/small-file-renamer/$pkgname-$pkgver.tar.gz")
md5sums=('afd99b1438142b5b4a78213e92d32b63')
build() {
        cd "$srcdir/$pkgname-$pkgver"
        ./configure --prefix=/usr
        make
}
package() {
        cd "$srcdir/$pkgname-$pkgver"
        make DESTDIR="$pkgdir/" install
}

