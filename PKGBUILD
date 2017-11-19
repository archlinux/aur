# Contributor: Ivy Foster <joyfulgirl@archlinux.us>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Heeru Kiyura <M8R-p9i5nh@mailinator.com>

pkgname=conkeror
pkgver=1.0.3
pkgrel=3
pkgdesc='A highly programmable web browser based on Mozilla XULRunner'
arch=('i686' 'x86_64')
url='http://conkeror.org/'
license=('MPL' 'GPL' 'LGPL')
depends=('palemoon') # tested with palemoon-bin
source=("$pkgname-$pkgver.tar.gz::http://repo.or.cz/conkeror.git/snapshot/$pkgver.tar.gz" conkeror.sh)
md5sums=('c496c836c1b5b5ea573329f1115bda34'
         'a77e1984b610488ffb06bc1d24f771a5')

build() {
  cd $pkgname-$pkgver*/
  make PREFIX=/usr
}

package() {
  cd $pkgname-$pkgver*/
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm755 "$srcdir"/$pkgname.sh "$pkgdir"/usr/bin/$pkgname
}
