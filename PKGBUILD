# Maintainer: Andrew Hill <andrew@andrewkhill.com>
pkgname=bok
pkgver() {
	printf $(git describe | sed "s/-/./g")
}
pkgver=v1.0.3.g93c8821
pkgrel=1
pkgdesc="A simple shellscript to manage personal journals"
arch=('any')
url="https://github.com/astroengisci/bok"
license=('GPL')
source=('bok' 'bokrc.default' 'bok.1' 'Makefile')
depends=('sh' 'less' 'grep')
makedepends=('git')
provides=("$pkgname")
conflicts=("$pkgname")
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP') #autofill using updpkgsums

package() {
	cd "$srcdir"
  make PREFIX="/usr" DESTDIR="$pkgdir" -s install
}
