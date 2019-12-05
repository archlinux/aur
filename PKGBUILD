# Maintainer: Stick <stick@stma.is>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=xerox-workcentre-6505
pkgver=1.0
pkgrel=1
pkgdesc="CUPS driver for the Xerox WorkCentre 6505"
url='https://www.support.xerox.com/support/workcentre-6505/downloads/enus.html?operatingSystem=linux'
license=('custom')
arch=('any')
depends=('cups')
makedepends=('rpmextract')
source=("$pkgname.rpm::http://download.support.xerox.com/pub/drivers/WC6505/drivers/linux/en_GB/Xerox-WorkCentre-6505-Linux.rpm"
        "LICENSE")
sha256sums=('c833ba8e00a73d1e633ad7a47bd7f08b516f17a6783e90550ff616f09fd16489'
            'c13727c7e2e002709fca9a32d69b99c95e70122fadd860bccd5f0a963ea01273')

build() {
	cd "$srcdir" || exit
	rpmextract.sh "$pkgname.rpm" || exit
}

package() {
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
	cd "$srcdir" || exit
	cp -r usr "$pkgdir"
}

