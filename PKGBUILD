# Maintainer: Mathieu Tortuyaux <mathieu.tortuyaux@gmail.com>
pkgname=terracognita
pkgver=0.3.0
pkgrel=1
epoch=1
pkgdesc="Reads from existing Cloud Providers (reverse Terraform) and generates your infrastructure as code on Terraform configuration"
arch=('i386' 'x86_64')
url="https://github.com/cycloidio/$pkgname"
license=('MIT')
source_x86_64=("https://github.com/cycloidio/$pkgname/releases/download/v$pkgver/$pkgname-linux-amd64.tar.gz")
source_i386=("https://github.com/cycloidio/$pkgname/releases/download/v$pkgver/$pkgname-linux-386.tar.gz")
sha256sums_x86_64=('ee4fd1de0e73ba71dec158b74264362d358c1a675c0c2e2a606606c94a81b189')
sha256sums_i386=('29e1cf5409e43a37a4c26ffc5082d0758fc4e167c087a14d91d3c1cf0371b356')

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
