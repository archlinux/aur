# Maintainer: Andrew Hill <andrew@andrewkhill.com>
pkgname=bok
pkgver() {
	cd "$srcdir/$pkgname"
	printf $(git describe | sed "s/-/./g")
}
pkgver=v1.0.5.gcdac9ea
pkgrel=1
pkgdesc="A simple shellscript to manage personal journals"
arch=('any')
url="https://github.com/astroengisci/bok"
license=('GPL')
source=("git+$url")
depends=('sh' 'less' 'grep')
makedepends=('git')
provides=("$pkgname")
conflicts=("$pkgname")
md5sums=('SKIP') #autofill using updpkgsums

package() {
	cd "$srcdir/$pkgname"
  make PREFIX="/usr" DESTDIR="$pkgdir" -s install
}
