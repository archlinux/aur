# Maintainer: Mathieu Tortuyaux <mathieu.tortuyaux@gmail.com>
pkgname=terracognita
pkgver=0.6.0
pkgrel=1
epoch=1
pkgdesc="Reads from existing Cloud Providers (reverse Terraform) and generates your infrastructure as code on Terraform configuration"
arch=('i386' 'x86_64')
url="https://github.com/cycloidio/$pkgname"
license=('MIT')
source_x86_64=("https://github.com/cycloidio/$pkgname/releases/download/v$pkgver/$pkgname-linux-amd64.tar.gz")
source_i386=("https://github.com/cycloidio/$pkgname/releases/download/v$pkgver/$pkgname-linux-386.tar.gz")
sha256sums_i386=('9dc2bc931f5c02068c2ff2f206926342e677ed32e94c4d8cec715f9c87f81069')
sha256sums_x86_64=('5175b898823db6902735e0c506e682759d4bd5082de1a0a55ad1d79d5e539fa8')

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
