# Maintainer: kharovtobi <tugboat_khatov@outlook.com>
_pkgname=libgvps
pkgname=$_pkgname-git
pkgver=2f1b410
pkgrel=2
pkgdesc=" Generic Viterbi Path Searcher Library"
arch=('x86_64')
url="https://github.com/Sleepwalking/libgvps"
makedepends=('git' 'gcc')
license=('BSD-3')
provides=('libgvps')
replaces=('libgvps')
conflicts=('libgvps')
source=("$_pkgname::git+https://github.com/Sleepwalking/libgvps.git")
sha256sums=('SKIP')
build() {
    #no version, its git
	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
	#makefile needs sudo! (it installs directly into your system)
	#make DESTDIR="$pkgdir/" install
	mkdir -p "$pkgdir"/usr/lib/
	mkdir -p "$pkgdir"/usr/include/"$_pkgname"
	mkdir -p "$pkgdir"/usr/licenses/"$_pkgname"
	cp build/libgvps.a "$pkgdir"/usr/lib/
	cp gvps.h "$pkgdir"/usr/include/"$_pkgname"
	cp LICENSE "$pkgdir"/usr/licenses/"$_pkgname"

}
