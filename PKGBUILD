# Maintainer: Mathieu Tortuyaux <mathieu.tortuyaux@gmail.com>
pkgname=inframap
pkgver=0.2.0
pkgrel=1
epoch=0
pkgdesc="Read your tfstate or HCL to generate a graph specific for each provider, showing only the resources that are most important/relevant"
arch=('i386' 'x86_64')
url="https://github.com/cycloidio/$pkgname"
license=('MIT')
source_x86_64=("https://github.com/cycloidio/$pkgname/releases/download/v$pkgver/$pkgname-linux-amd64.tar.gz")
source_i386=("https://github.com/cycloidio/$pkgname/releases/download/v$pkgver/$pkgname-linux-386.tar.gz")
sha256sums_i386=('125d615b54eebaf615a5a96a46d559d0e21f7aaf6c1a4f82f25c6f9f7e2edf5e')
sha256sums_x86_64=('7419b45fb07f414856858ec861d8308f5a9b7a226e43224ed64ae5d7ca73f4c1')

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
