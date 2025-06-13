# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname="xerox-workcentre-6015"
pkgver="1.0"
_subver="28"
pkgrel=1
pkgdesc="Xerox Workcentre 6015B/6015N/6015NI color laser printer CUPS driver"
url="https://www.support.xerox.com/en-us/product/workcentre-6015/downloads?platform=linux"
arch=('i686' 'x86_64')
license=('custom')
depends=('cups' 'lib32-libcups')
makedepends=('rpmextract')
source=("https://download.support.xerox.com/pub/drivers/WC6015/drivers/linux/en_GB/Xerox-WorkCentre-6015B_6015N_6015NI-${pkgver}-${_subver}.i586.zip")
b2sums=('01a30c42f406a6feecbdb997d8e8bdcb98232125455df9248017da0579633348f3df54f2274fd0337654068bc2ef99299b85e2b3c2e48aa2dc2221a13f70a40c')

prepare() {
	cd "$srcdir" || exit
	rpmextract.sh "Xerox-WorkCentre-6015B_6015N_6015NI-${pkgver}-${_subver}.i586.rpm" || exit
}

package() {
	cd "$srcdir" || exit
	cp -r usr "$pkgdir"
}

