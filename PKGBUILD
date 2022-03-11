# Maintainer: XavRan <leandro.espinozar@protonmail.com>
# Contributor: Ivy Foster <joyfulgirl@archlinux.us>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Heeru Kiyura <M8R-p9i5nh@mailinator.com>

pkgname=conkeror
pkgver=1.0.4
pkgrel=6
pkgdesc='A highly programmable web browser based on Mozilla XULRunner'
arch=('i686' 'x86_64')
url='http://conkeror.org/'
license=('MPL' 'GPL' 'LGPL')
depends=('palemoon')
source=("$pkgname-$pkgver.tar.gz::http://repo.or.cz/conkeror.git/snapshot/685f24e3aeffc408dcea883e1d0c738cb18bbe8d.tar.gz" conkeror.sh)
sha256sums=('0cc13ac0415f6f8d9f1641f45b00bcd173347c45aba3b3de6d7951b1d1f03dbe'
            '64aa16cbb2f6485439ad877a34bc372e162a9fc8aad330355515d1b4f09a75b4')

build() {
  cd $pkgname-*/
  make PREFIX=/usr
}

package() {
  cd $pkgname-*/
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm755 "$srcdir"/$pkgname.sh "$pkgdir"/usr/bin/$pkgname
}
