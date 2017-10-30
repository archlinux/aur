# Maintainer: Dustin Van Tate Testa <toast27@gmail.com>
pkgname=ys-git
pkgver=v0.0.9.alpha.r128.g0f794f9 # calls `pkgver()` to replace this number (ver from git)
pkgrel=1
license=('GPL')
pkgdesc="A stack-based scripting language/interpreter"
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
#	mkdir $pkgdir/usr/lib/

	g++ *.cpp -Wall -Wextra -g -o $pkgdir/usr/bin/ys

#	install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE

}
