# Maintainer: Mathieu Tortuyaux <mathieu.tortuyaux@gmail.com>
pkgname=inframap
pkgver=0.7.0
pkgrel=1
epoch=0
pkgdesc="Read your tfstate or HCL to generate a graph specific for each provider, showing only the resources that are most important/relevant"
arch=('i386' 'x86_64')
url="https://github.com/cycloidio/$pkgname"
license=('MIT')
source_x86_64=("https://github.com/cycloidio/$pkgname/releases/download/v$pkgver/$pkgname-linux-amd64.tar.gz")
source_i386=("https://github.com/cycloidio/$pkgname/releases/download/v$pkgver/$pkgname-linux-386.tar.gz")
sha256sums_i386=('5a484c4d902fec31b55cf080180d5029f8f391c009d964682e006ea1c25ad8c3')
sha256sums_x86_64=('71574490e2024c6dbfcf954509c468bdf0b82bb8bf549c4b649f6a09f9705215')

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
