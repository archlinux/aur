# Contributor: damir <damir at archlinux dot org>
# Contributor: Pierre Chapuis <catwell at archlinux dot us>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=yudit
pkgver=3.0.8
pkgrel=1
pkgdesc="A free Unicode plain-text editor for Unix-like systems."
arch=('i686' 'x86_64')
url="http://www.yudit.org/"
license=('GPL')
depends=('libx11' 'gcc-libs')
optdepends=('hunspell: spell checking')
source=("http://yudit.org/download/$pkgname-$pkgver.tar.gz")
md5sums=('eb73aeee53723c08a9f7b6fa5bb09d03')
sha1sums=('3a5b2e588764823398ee13aafbe2f3ef662be4d2')
sha256sums=('f7868b208b290a4adab16003cc7a8742a47d65c6a8c0bc73095cdd2696bd4d36')
sha512sums=('9cf316af4da319aa6ab0e1f1594deb7b4c77abbb873d4cfd41f93719ba4313ee1690bd496248bc78628cbd3261957dbd87f9c1518f24199017f6bf235751a2bb')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
