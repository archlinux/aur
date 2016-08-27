# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
pkgname=simplesysexxer
pkgver=0.3
pkgrel=2
pkgdesc="a GUI tool to create backups of the memory contents of MIDI devices"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.christeck.de/wp/products/simple-sysexxer"
license=('GPL')
depends=('qt4')
source=("http://downloads.sourceforge.net/project/sysexxer/SimpleSysexxer-$pkgver/SimpleSysexxer-$pkgver.tar.gz")
md5sums=('59c1b91089bb15050e3a58aa602332db')

prepare() {
	cd "SimpleSysexxer-$pkgver"
  sed "s#/usr/local/bin#/usr/bin#g" -i SimpleSysexxer.pro
  qmake-qt4 SimpleSysexxer.pro
}

build() {
	cd "SimpleSysexxer-$pkgver"
	make
}

package() {
	cd "SimpleSysexxer-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
