# Maintainer: Mathieu Tortuyaux <mathieu.tortuyaux@gmail.com>
pkgname=inframap
pkgver=0.3.1
pkgrel=1
epoch=0
pkgdesc="Read your tfstate or HCL to generate a graph specific for each provider, showing only the resources that are most important/relevant"
arch=('i386' 'x86_64')
url="https://github.com/cycloidio/$pkgname"
license=('MIT')
source_x86_64=("https://github.com/cycloidio/$pkgname/releases/download/v$pkgver/$pkgname-linux-amd64.tar.gz")
source_i386=("https://github.com/cycloidio/$pkgname/releases/download/v$pkgver/$pkgname-linux-386.tar.gz")
sha256sums_i386=('f6d186e57f4e42f62f3cb19ad1d3539e7f88674d37cc9dc2ba5b3c0883549d2b')
sha256sums_x86_64=('42740f92bded7ae76dd8564aa4c4d788acc9f6517cc15f1487b67b77c92d0d97')

package() {
	case $CARCH in
          "x86_64")
		install -Dm755 "$srcdir/$pkgname-linux-amd64" "$pkgdir/usr/bin/$pkgname"
		;;
          "i386")
		install -Dm755 "$srcdir/$pkgname-linux-386" "$pkgdir/usr/bin/$pkgname"
		;;
	esac
}
