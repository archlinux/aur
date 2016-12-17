# Maintainer: Declan Hoare <declanhoare at exemail dot com dot au>
pkgname=edlin
pkgver=2.15
pkgrel=1
pkgdesc="FreeDOS line editor"
arch=('i686' 'x86_64')
url="http://www.freedos.org/"
license=('GPL')
depends=('glibc')
source=("edlin-2.15.zip::http://downloads.sourceforge.net/project/freedos-edlin/freedos-edlin/2.15/edlin-2.15.zip")
md5sums=('4b51e2ed2d642fa75b3b0e11d310b961')
sha1sums=('2a7c3e33ce671fa7058d1303a5f21976c8c5faa9')
sha224sums=('e4de0e4ac8e72ad5d1ea30356c1a7b2a650f9ded30181fc635e8a9bd')
sha256sums=('d67954ba065dd6dc5e897e2d4b30dbc34dc81f6b09d58bc4a4257acb359d289f')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
