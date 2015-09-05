# Maintainer: Megameneer (Dennis Holierhoek) <dennis.hh@hotmail.com>
pkgname=stripe
pkgver=2.0
pkgrel=2
pkgdesc="A software tool which converts a polygonal model into triangle strips"
arch=('any')
url=http://www3.cs.stonybrook.edu/~stripe/
license=('custom:stripe')
depends=()
makedepends=()
source=(http://www3.cs.stonybrook.edu/~stripe/stripe.tar.gz)
md5sums=('1315c175d95b56f1a9b6a25e942775d5')
sha256sums=('96af9841e3d22f3e1b5238d0c21fe3db3b28d2e030c6eeffd19e4a595fd8ac1f')

build() {
	cd "$srcdir"/Stripe
	make
}

package() {
	cd "$srcdir"/..
	gzip stripe.1
	install -Dm644 stripe.1.gz "$pkgdir"/usr/share/man/man1/stripe.1.gz
	install -Dm644 stripelicense.html "$pkgdir"/usr/share/licenses/stripe/stripelicense.html
	cd "$srcdir"/Stripe
	install -Dm755 stripe "$pkgdir"/usr/bin/stripe
}
