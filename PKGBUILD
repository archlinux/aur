# Maintainer: Arti Zirk <arti.zirk@gmail.com>

pkgname=rauc
pkgver=0.2
pkgrel=1
pkgdesc="RAUC controls the update process on embedded linux systems. It is both a target application that runs as an update client and a host/target tool that allows you to create, inspect and modify installation artifacts."
arch=('i686' 'x86_64')
url="https://github.com/rauc/rauc"
license=('GPL')
depends=('curl' 'json-glib')
makedepends=('python')
source=(https://github.com/$pkgname/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz)
#        https://github.com/$pkgname/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz.asc)
sha256sums=('83aa3ac3716e1c29315162e3cbf5d4db79f26dd95efe1bc634bbce364b95491a')
#         'SKIP')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
# vim:syntax=sh
