# Contributor: damir <damir at archlinux dot org>
# Contributor: Pierre Chapuis <catwell at archlinux dot us>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=yudit
pkgver=3.0.7
pkgrel=1
pkgdesc="A free Unicode plain-text editor for Unix-like systems."
arch=('i686' 'x86_64')
url="http://www.yudit.org/"
license=('GPL')
depends=('libx11')
optdepends=('hunspell: spell checking')
source=("http://yudit.org/download/$pkgname-$pkgver.tar.gz")
md5sums=('cbc1a89cc962d2674281692d17aefd7d')
sha1sums=('0e48ad6c794aa1b40df684c28cef5349506baaf0')
sha256sums=('e89afb50ad4e0ca39edf509c8619d96003a1cd29707f879a6302f2cc9509fd37')
sha512sums=('6c8740e891c73862a7e170fe6482c27677db523c6f2fdf9a5f0cab17fc358f8ef275de4c588aa61a65271307e61f29734429b8f5d06645c23b618dd5b4777c27')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

