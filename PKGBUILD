# Maintainer: Stefand Probst <s1probst@edu.aau.at>
pkgname="nesc"
pkgver=1.3.6
pkgrel=1
pkgdesc="A extension to the C programming language designed to embody the structuring concepts and execution model of TinyOS."
arch=('i686' 'x86_64')
url="https://github.com/tinyos/nesc/"
license=('GPL2')
depends=('emacs' 'gperf' 'bison' 'flex' 'java-environment')
makedepends=('automake' 'autoconf')
options=('!buildflags')
source=("https://github.com/tinyos/$pkgname/archive/v$pkgver.zip")
md5sums=('985866de3e5fd1deb3648db2f1b06566')


build() {
	cd "$pkgname-$pkgver"
  ./Bootstrap
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
