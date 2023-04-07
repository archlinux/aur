#Maintainer: semtor<semtorcc@gmail.com>
pkgname=cs
pkgver=0.1.2
pkgrel=1
epoch= 
pkgdesc="The Ls command with icons implemented in C++"
arch=('x86_64')
url="https://github.com/semtor/cs"
license=('MIT')
makedepends=('gcc-libs' 'glibc' 'xmake' 'git')
source=("$pkgname-$pkgver::$url/archive/refs/tags/$pkgver.tar.gz")
#noextract=("${source[@]##*/}")
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
  mkdir build&&cd build
  cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/usr ..
}

package() {
	cd "$pkgname-$pkgver"
  cd build
  make && make install
}
