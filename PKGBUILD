# Maintainer: Isabella Basso do Amaral <isabbasso at riseup dot com>
# Contributor: Auguste Pop <auguste [at] gmail [dot] com>

pkgname=lucidor
pkgver=0.9.15
pkgrel=1
pkgdesc="A program for reading and handling EPUB e-books and OPDS catalogs"
arch=('i686' 'x86_64')
url="https://lucidor.org/lucidor/"
license=('GPL3')
depends=('palemoon' 'desktop-file-utils')
install=$pkgname.install
source=(${pkgname}_${pkgver}.tar.gz::"http://lucidor.org/get.php?id=${pkgname}_${pkgver}.tar.gz")
sha256sums=('0e23617e1db5a1e5d1a491badf9cc0eab972bee3b2ea2418816c79dabe20a4be')

build()
{
    cd $srcdir/$pkgname-$pkgver
    make
}

package()
{
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR=$pkgdir install
}
