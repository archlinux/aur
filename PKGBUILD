# Maintainer: Arno Onken <asnelt@asnelt.org>
pkgname=rrep
pkgver=1.3.7
pkgrel=1
pkgdesc='Replaces strings with regular expressions in files and directories'
arch=('x86_64')
url='https://sourceforge.net/projects/rrep/'
license=('GPL3')
depends=('acl')
makedepends=('gettext')
source=("https://download.sourceforge.net/rrep/$pkgname-$pkgver.tar.gz")
sha256sums=('6179798a5e86833c455cf3e5f65ce6cc35f6d3888f47d74de8346e1bfa211fcd')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
