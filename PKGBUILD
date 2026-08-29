# Maintainer: Michal Babik <michal.babik@protonmail.com>

pkgname=sfrename
pkgver=1.2.10
pkgrel=1
pkgdesc="Program for renaming files and directories"
arch=('i686' 'x86_64')
url="https://www.nongnu.org/small-file-renamer/"
license=('GPL3')
depends=('gtk3>=3.22.0')
makedepends=('autoconf' 'automake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mi-bb/sfrename/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('608d18b92d7a8edb3094a1a875dd929a24529a111be9e4349d4ff41f68305104')
build() {
        cd "$srcdir/$pkgname-$pkgver"
        ./autogen.sh
        ./configure --prefix=/usr
        make
}
package() {
        cd "$srcdir/$pkgname-$pkgver"
        make DESTDIR="$pkgdir/" install
}

