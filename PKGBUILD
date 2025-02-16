# Maintainer: kharovtobi <tugboat_khatov at outlook dot com>

_pkgname=libgvps
pkgname=$_pkgname-git
pkgver=r15.2f1b410
pkgrel=1
pkgdesc="Generic Viterbi Path Searcher Library"
arch=('x86_64')
url="https://github.com/Sleepwalking/libgvps"
makedepends=('git' 'gcc')
license=('BSD-3-Clause')
provides=('libgvps')
source=("$_pkgname::git+https://github.com/Sleepwalking/libgvps.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir"/"$_pkgname"
    echo r$(git rev-list --count HEAD).$(git rev-parse --short=7 HEAD)
}

build() {
	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
	install -Dm644 build/libgvps.a "$pkgdir"/usr/lib/libgvps.a
	install -Dm644 gvps.h "$pkgdir"/usr/include/"$_pkgname"
}
