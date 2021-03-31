# Maintainer: Mathieu Tortuyaux <mathieu.tortuyaux@gmail.com>
pkgname=terracognita
pkgver=0.6.3
pkgrel=1
epoch=1
pkgdesc="Reads from existing Cloud Providers (reverse Terraform) and generates your infrastructure as code on Terraform configuration"
arch=('i386' 'x86_64')
url="https://github.com/cycloidio/$pkgname"
license=('MIT')
source_x86_64=("https://github.com/cycloidio/$pkgname/releases/download/v$pkgver/$pkgname-linux-amd64.tar.gz")
source_i386=("https://github.com/cycloidio/$pkgname/releases/download/v$pkgver/$pkgname-linux-386.tar.gz")
sha256sums_i386=('cf90d73d0443aa4927fede918bbe14f86a1abff838374a4b1ac314b13aea981d')
sha256sums_x86_64=('f5038771a207d8969e08df22b22d243da21505bf674acbcfa93deb161efe8e28')

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
