#Maintainer: semtor<semtorcc@gmail.com>
pkgname=cs
pkgver=0.1.1
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
  xmake
}

package() {
	cd "$pkgname-$pkgver"
  mkdir $pkgdir/usr/bin -p
  cp build/linux/x86_64/release/cs $pkgdir/usr/bin
}
