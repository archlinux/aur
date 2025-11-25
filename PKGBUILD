# Maintainer: Ted pheenty Lukin <fedorlukin2006@gmail.com>

pkgname=wadext
pkgver=2.1
pkgrel=1
pkgdesc="A simple WAD extraction command line tool for Doom-engine mods"
arch=(any)
url="https://github.com/ZDoom/wadext"
license=('GPL-3.0-or-later')
makedepends=(cmake)
source=("git+$url#tag=$pkgver")
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	cmake . -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    cmake --build .
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
