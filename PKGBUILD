# Maintainer: doragasu <doragasu (yawn) hotmail (roll) com>

pkgname=tizen-sdb
pkgver=2.2.29
pkgrel=2
pkgdesc="Tizen Smart Development Bridge"
arch=('i686' 'x86_64')
url="https://github.com/TizenTeam/sdb"
license=('Apache')
groups=()
provides=('tizen-sdb')
source=("git+https://github.com/TizenTeam/sdb#tag=2.2.1_release"
	"gcc10p_build.patch")
sha512sums=('SKIP'
	"bee305150425088409b3e41a6edb04b342d49b563619c3aedb6e5c13412c26e82d34a04ea41ea6c835759dfc2a6d03f6ce54ffe6b0284b1eb16f31b813d31078")

build() {
	cd $srcdir/sdb
	patch -p1 < ../gcc10p_build.patch
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$srcdir/sdb/bin/sdb" "$pkgdir/usr/bin/"
} 
