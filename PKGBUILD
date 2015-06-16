# Author : Piotr Grzeszczak <piotrek91666@o2.pl>
# Maintainer: Esclapion <esclapion@gmail.com>
 
pkgname=qlogout
pkgver=1.0
pkgrel=2
pkgdesc="Logout application intended for lxqt"
arch=('i686' 'x86_64')
url="https://forum.manjaro.org/index.php?topic=15538.msg144265#msg144265"
license=('GPL')
groups=()
depends=('qt4')
makedepends=('qtchooser')
optdepends=()
provides=('qlogout')
conflicts=('qtlogout')
replaces=()
backup=()
options=()
install=
changelog=
source=("http://esclapion.free.fr/AUR/qlogout-1.0.tar.gz")
md5sums=('a6a189651238a758d47263e747456f44')
 
build() {
        cd "$srcdir/$pkgname-$pkgver"
        qmake-qt4 "INSTALL_PREFIX=/usr"
}
 
package() {
        cd "$srcdir/$pkgname-$pkgver"
        make #INSTALLROOT="$pkgdir/" install
        mkdir -p $pkgdir/usr/bin/
        cp qtLogout $pkgdir/usr/bin/qlogout
}
