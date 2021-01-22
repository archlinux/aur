# Maintainer: Mathieu Tortuyaux <mathieu.tortuyaux@gmail.com>
pkgname=inframap
pkgver=0.5.1
pkgrel=1
epoch=0
pkgdesc="Read your tfstate or HCL to generate a graph specific for each provider, showing only the resources that are most important/relevant"
arch=('i386' 'x86_64')
url="https://github.com/cycloidio/$pkgname"
license=('MIT')
source_x86_64=("https://github.com/cycloidio/$pkgname/releases/download/v$pkgver/$pkgname-linux-amd64.tar.gz")
source_i386=("https://github.com/cycloidio/$pkgname/releases/download/v$pkgver/$pkgname-linux-386.tar.gz")
sha256sums_i386=('1a8052d1459f53ccaedc66e675b3c3e0cd0fcb3a94131c9223b8d80d4ed7dc7a')
sha256sums_x86_64=('4ccf4528a7f2632ab0fbe26abf07b27f32c3f2e2a262094d2967bacb03fed12e')

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
