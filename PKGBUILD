# Maintainer: Kristopher James Kent (kjkent) <aur@kjkent.dev>
# Contributor: Polis Minus <polisminus2247@tuta.io>
pkgname=donut.c
pkgver=2.0
pkgrel=1
pkgdesc='Donut-shaped C code that outputs a 3D spinning donut'
arch=('any')
url='https://www.a1k0n.net/2021/01/13/optimizing-donut.html'
license=('none')
b2sums=('ef3b976cd367bc2aa1c69f75901570e754ac9efe25cfe5ace767b6a239c9a8a98499e9998afad24c128d5a89ad60eef1e5ea600feb513942b1942c248dd0eea0')
source=("$pkgname")

build() {
	_flags=(
		'-Wno-implicit-function-declaration'
		'-Wno-implicit-int'
		'-Wno-builtin-declaration-mismatch'
		'-w'
	)
	gcc "${_flags[@]}" donut.c -o donut
}

package() {
	install -D donut "$pkgdir/usr/bin/donut"
}
