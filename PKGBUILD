# Contributor: Ivy Foster <joyfulgirl@archlinux.us>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Heeru Kiyura <M8R-p9i5nh@mailinator.com>

pkgname=conkeror
pkgver=1.0.4
pkgrel=3
pkgdesc='A highly programmable web browser based on Mozilla XULRunner'
arch=('i686' 'x86_64')
url='http://conkeror.org/'
license=('MPL' 'GPL' 'LGPL')
depends=('palemoon-bin')
source=("$pkgname-$pkgver.tar.gz::http://repo.or.cz/conkeror.git/snapshot/685f24e3aeffc408dcea883e1d0c738cb18bbe8d.tar.gz" conkeror.sh)
sha256sums=('0cc13ac0415f6f8d9f1641f45b00bcd173347c45aba3b3de6d7951b1d1f03dbe'
            '83b99b57ff5f397ff97561dc82bf604a223b3fdb2e80716edf12f006ae94d88c')

build() {
  cd $pkgname-$pkgver*/
  make PREFIX=/usr
}

package() {
  cd $pkgname-$pkgver*/
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm755 "$srcdir"/$pkgname.sh "$pkgdir"/usr/bin/$pkgname
}
