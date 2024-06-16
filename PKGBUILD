# Maintainer: iamawacko <iamawacko@protonmail.com>
pkgname=osintgram
pkgver="1.3"
pkgrel=1
pkgdesc="An Instagram OSINT tool with an interactive shell"
url='https://github.com/Datalux/Osintgram'
arch=('any')
license=('GPL-3.0-or-later')
depends=(
	python
	python-requests
	python-requests-toolbelt
	python-geopy
	python-prettytable
	python-instagram-private-api
	python-gnureadline
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	"osintgram")
sha256sums=('0fb902370a4a001d89b3ec1c8119fb2420399abdac883f54ad0b5cc9bf73a9ea'
            '7b1767d427dba59ff4951c4b5ad0c1ccf624e5606a68d9653007fb36f76d7a8d')

package() {
    install -Dm755 osintgram -t $pkgdir/usr/bin
    cd Osintgram-$pkgver
    install -D main.py -t  $pkgdir/opt/osintgram/
    install -D src/* -t $pkgdir/opt/osintgram/src
}
