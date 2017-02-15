# Contributor: sg3des <sg3des@gmail.com>

pkgname=goatee
pkgver=0.9
pkgrel=2
pkgdesc='lightwieght gtk2 text/hex editor written on Go'
arch=('i686' 'x86_64')
url='https://github.com/sg3des/goatee'
license=('GPL')
depends=('gtk2' 'gtksourceview2')
makedepends=('git' 'go')
source=("git://github.com/sg3des/goatee.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
	GOPATH="$srcdir" go get -v ./...
	GOPATH="$srcdir" go build -v -o $pkgname
}

package() {
  cd "$srcdir/$pkgname"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}