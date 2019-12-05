# Maintainer: Stick <stick@stma.is>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=xerox-workcentre-6515
pkgver=5.20.661.4639
pkgrel=1
pkgdesc="CUPS driver for the Xerox WorkCentre 6515"
url='https://www.support.xerox.com/support/workcentre-6515/downloads/enus.html?operatingSystem=linux'
license=('custom')
arch=('i686' 'x86_64')
depends=('cups')
makedepends=('rpmextract')
source_i686=("$pkgname.rpm::http://download.support.xerox.com/pub/drivers/CQ8580/drivers/linux/pt_BR/Xeroxv5Pkg-Linuxi686-$pkgver.rpm")
source_x86_64=("$pkgname.rpm::http://download.support.xerox.com/pub/drivers/CQ8580/drivers/linux/pt_BR/Xeroxv5Pkg-Linuxx86_64-$pkgver.rpm")
source=("LICENSE")
sha256sums_i686=('630da30b503f80fb685158771ad3064f05c9be821cdb409ef87506efc185dd15')
sha256sums_x86_64=('82e1a45bbd2bf23ae10e3b78366e6ad4a51c7bb2dcdb0cef20e8d17d9abbad4c')
sha256sums=('45607ad97f4fbba48dfc5150c5ad93deb6b2b57a5ae2d32299418cae682f23b8')

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

