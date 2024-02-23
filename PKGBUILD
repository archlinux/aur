# Maintainer: doragasu <doragasu (yawn) hotmail (roll) com>

pkgname=tizen-sdb
pkgver=2.3.2
pkgrel=1
pkgdesc="Tizen Smart Development Bridge"
arch=('i686' 'x86_64')
url="https://github.com/TizenTeam/sdb"
license=('Apache')
groups=()
provides=('tizen-sdb')
source=("git+https://git.tizen.org/cgit/sdk/tools/sdb"
	"gcc10p_build.patch")
sha512sums=('SKIP'
    "91c999da553e4309b9f40eb432d270986f3b90c5d21ee5c41018b9dcc718be94b17988336a54d7cdbf751baf472bdf4cc3e1abe16bb3a229d9fa8e39dd717e56")

prepare() {
	cd $srcdir/sdb
	git checkout origin/tizen_studio
	patch -p1 < ../gcc10p_build.patch
}

build() {
	cd $srcdir/sdb
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$srcdir/sdb/bin/sdb" "$pkgdir/usr/bin/"
} 
