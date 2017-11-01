# Maintainer: Dustin Van Tate Testa <toast27@gmail.com>


pkgname=ys-git
pkgver=v0.0.9.alpha.r131.gca1b1de # calls `pkgver()` to replace this number (ver from git)
pkgrel=1
license=('GPL')
pkgdesc="An interpreter for the YodaScirpt Language"
url="https://github.com/dvtate/yoda"

arch=('any')

makedepends=('git')

provides=("ys")

source=("$pkgname::git+https://github.com/dvtate/yoda")

md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd $pkgname

	mkdir $pkgdir/usr/
	mkdir $pkgdir/usr/bin/

	g++ *.cpp -Wall -Wextra -g -o ys
	install -D -m644 ys $pkgdir/usr/bin/ys

}

