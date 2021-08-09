# PKGBUILD for xgraph from http://www.xgraph.org/
# Maintainer: ThanosApostolou <thanosapostolou@outlook.com>]

pkgname=xgraph-bin
pkgver=4.38
pkgrel=1
pkgdesc="XGRAPH is a general purpose x-y data plotter with interactive buttons for panning, zooming, printing, and selecting display options."
arch=('i686' 'x86_64')
url="http://www.xgraph.org/"
license=('custom')
depends=('gtk2' 'libx11')
optdepends=('netpbm')
conflicts=('xgraph')
source_i686=("http://www.xgraph.org/linux/xgraph_4.38_linux32.tar.gz")
source_x86_64=("http://www.xgraph.org/linux/xgraph_4.38_linux64.tar.gz")
sha256sums_i686=('a117e5c47d362ed372ca6232f1777a4e475199960a0dcb5f1b526902a18783c2')
sha256sums_x86_64=('0905f51ac5699366077f62d0f797bb84bbd62c1ddd67ee825f7809d2b60f1f61')

package() {
	if test "$CARCH" == x86_64; then
		_folder="XGraph4.38_linux64"
	elif test "$CARCH" == i686; then
		_folder="XGraph4.38_linux32"
	fi
	cd $srcdir/${_folder}
	install -Dm755 ./bin/xgraph "$pkgdir/usr/bin/xgraph"
	install -Dm644 Readme.txt "$pkgdir/usr/share/xgraph/Readme.txt"
	install -Dm644 testxy.dat "$pkgdir/usr/share/xgraph/testxy.dat"
	install -Dm644 ./data/oofficedata.scz "$pkgdir/usr/share/xgraph/data/oofficedata.scz"
	install -Dm644 ./data/pptxdata.scz "$pkgdir/usr/share/xgraph/data/pptxdata.scz"
	install -Dm644 ./data/sxidata.scz "$pkgdir/usr/share/xgraph/data/sxidata.scz"
	install -Dm644 ./data/pptx/thumbnail.jpeg "$pkgdir/usr/share/xgraph/data/pptx/thumbnail.jpeg"
}
