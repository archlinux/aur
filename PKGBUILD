# Maintainer: Mathieu Tortuyaux <mathieu.tortuyaux@gmail.com>
pkgname=inframap
pkgver=0.5.0
pkgrel=1
epoch=0
pkgdesc="Read your tfstate or HCL to generate a graph specific for each provider, showing only the resources that are most important/relevant"
arch=('i386' 'x86_64')
url="https://github.com/cycloidio/$pkgname"
license=('MIT')
source_x86_64=("https://github.com/cycloidio/$pkgname/releases/download/v$pkgver/$pkgname-linux-amd64.tar.gz")
source_i386=("https://github.com/cycloidio/$pkgname/releases/download/v$pkgver/$pkgname-linux-386.tar.gz")
sha256sums_i386=('a10c6d089513740e97012a61c9cdf87928be2f692eb69f5f2474bcbfadb0d9a1')
sha256sums_x86_64=('e1d7119713faa8f98731dc3d63ba5a2b4d6d076438b1e85c52c3913ae46884d3')

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
