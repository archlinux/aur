# Maintainer: Mathieu Tortuyaux <mathieu.tortuyaux@gmail.com>
pkgname=terracognita
pkgver=0.7.4
pkgrel=1
epoch=1
pkgdesc="Reads from existing Cloud Providers (reverse Terraform) and generates your infrastructure as code on Terraform configuration"
arch=('i386' 'x86_64')
url="https://github.com/cycloidio/$pkgname"
license=('MIT')
source_x86_64=("https://github.com/cycloidio/$pkgname/releases/download/v$pkgver/$pkgname-linux-amd64.tar.gz")
source_i386=("https://github.com/cycloidio/$pkgname/releases/download/v$pkgver/$pkgname-linux-386.tar.gz")
sha256sums_i386=('20aa43f62d0e1ef17fbb9fe79ce30dd80434784b35789510709318e5db7a3f88')
sha256sums_x86_64=('42acf66cad1c1d607ad2eda202e01a01ae7f3b61d7cd9412da50281ff9b6bfbb')

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
