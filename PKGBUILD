# Maintainer: goll <adrian.goll+aur[at]gmail>
# Contributor: Kosava <kosava@gmail.com>

pkgname=butt
pkgver=0.1.14
pkgrel=1
pkgdesc="butt (broadcast using this tool) is an easy to use, multi OS streaming tool"
arch=('i686' 'x86_64')
license=("GPL2")
url="http://butt.sourceforge.net/"
depends=('fltk' 'libpng12')
optdepends=('icecast' 'shoutcast')
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha1sums=('f1dfba4f14f5584ef56790734754b4db8fa005a1')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
