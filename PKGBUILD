# Maintainer: Eric Richter <richter.eric.r@gmail.com>
pkgname=ripright
pkgver=0.9
pkgrel=1
pkgdesc="A minimal automatic CD ripper and tagging utility"
arch=('i686' 'x86_64')
url="http://www.mcternan.me.uk/ripright"
license=('GPL2')
depends=('curl' 'flac' 'cdparanoia' 'imagemagick' 'libdiscid')
makedepends=()
optdepends=()
provides=('ripright')
#install=${pkgname}
source=("http://www.mcternan.me.uk/ripright/software/$pkgname-$pkgver.tar.gz")
md5sums=('1ab4feab25ae9f886ba9811eb586044d')

build() {
	cd $pkgname-$pkgver

	./configure --prefix=/usr
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir/" install
}
