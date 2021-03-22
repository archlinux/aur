# Maintainer: Mathieu Tortuyaux <mathieu.tortuyaux@gmail.com>
pkgname=terracognita
pkgver=0.6.2
pkgrel=1
epoch=1
pkgdesc="Reads from existing Cloud Providers (reverse Terraform) and generates your infrastructure as code on Terraform configuration"
arch=('i386' 'x86_64')
url="https://github.com/cycloidio/$pkgname"
license=('MIT')
source_x86_64=("https://github.com/cycloidio/$pkgname/releases/download/v$pkgver/$pkgname-linux-amd64.tar.gz")
source_i386=("https://github.com/cycloidio/$pkgname/releases/download/v$pkgver/$pkgname-linux-386.tar.gz")
sha256sums_i386=('6f9eb4539094bf3959dc99e82a43b2b4a3ecbc80e98c79f0e0dc7688608d60e9')
sha256sums_x86_64=('b9a7ae491f4606fc0e766d774c0b42fd356d4230935f23978cb7f98318d88828')

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
