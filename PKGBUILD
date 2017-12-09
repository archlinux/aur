# Contributor: Ivy Foster <joyfulgirl@archlinux.us>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Heeru Kiyura <M8R-p9i5nh@mailinator.com>

pkgname=conkeror
pkgver=1.0.4
pkgrel=1
pkgdesc='A highly programmable web browser based on Mozilla XULRunner'
arch=('i686' 'x86_64')
url='http://conkeror.org/'
license=('MPL' 'GPL' 'LGPL')
depends=('palemoon-bin')
source=("$pkgname-$pkgver.tar.gz::http://repo.or.cz/conkeror.git/snapshot/685f24e3aeffc408dcea883e1d0c738cb18bbe8d.tar.gz" conkeror.sh)
sha256sums=('8c86f9517f7e529a985f1eb579f9d87ee288770c2a4e37db12a5ab16061a6f44'
            '3def19870f3413fca75ce2dad7ac2336114aac1b189c09bd53a003ec6ce2a84a')

build() {
  cd $pkgname-$pkgver*/
  make PREFIX=/usr
}

package() {
  cd $pkgname-$pkgver*/
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm755 "$srcdir"/$pkgname.sh "$pkgdir"/usr/bin/$pkgname
}
