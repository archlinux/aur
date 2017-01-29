# Contributor: Ivy Foster <joyfulgirl@archlinux.us>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Heeru Kiyura <M8R-p9i5nh@mailinator.com>

pkgname=conkeror
pkgver=1.0.3
pkgrel=1
pkgdesc='A highly programmable web browser based on Mozilla XULRunner'
arch=('i686' 'x86_64')
url='http://conkeror.org/'
license=('MPL' 'GPL' 'LGPL')
depends=('firefox')
source=("$pkgname-$pkgver.tar.gz::http://repo.or.cz/conkeror.git/snapshot/$pkgver.tar.gz")
md5sums=('c496c836c1b5b5ea573329f1115bda34')

build() {
	cd $pkgname-$pkgver*/
	make PREFIX=/usr
}

package() {
	cd $pkgname-$pkgver*/
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
