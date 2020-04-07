# Maintainer: Andrew Hill <andrew@andrewkhill.com>
pkgname=bok
pkgver() {
	cd "$srcdir/$pkgname"
	printf $(git describe | sed "s/-/./g")
}
pkgver=v1.0.1.g9cc54d9
pkgrel=1
pkgdesc="A simple shellscript to manage personal journals"
arch=('any')
url="https://github.com/astroengisci/bok"
license=('GPL')
depends=('sh')
makedepends=('git')
provides=("$pkgname")
conflicts=("$pkgname")
source=("git+$url")
md5sums=('SKIP') #autofill using updpkgsums

package() {
  cd "$pkgname"

  make PREFIX="/usr" DESTDIR="$pkgdir" -s install
}
