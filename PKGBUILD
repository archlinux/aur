#Maintainer: semtor<semtorcc@gmail.com>
pkgname=cs
pkgver=0.2.5
pkgrel=1
epoch= 
pkgdesc="The Ls command with icons implemented in C++"
arch=('x86_64')
url="https://github.com/semtor/cs"
license=('MIT')
makedepends=('cmake' 'git' 'make' 'g++')
source=("$pkgname-main::$url/archive/refs/heads/main.zip")
#noextract=("${source[@]##*/}")
md5sums=('SKIP')

build() {
	cd "$pkgname-main"
  mkdir build&&cd build
  cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/usr ..
}

package() {
	cd "$pkgname-main"
  cd build
  make && make install
}
