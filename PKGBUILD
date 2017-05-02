# PKGBUILD for xgraph from http://www.xgraph.org/
# Maintainer: ThanosApostolou <thanosapostolou@outlook.com>]

pkgname=xgraph-bin
pkgver=4.30
pkgrel=2
pkgdesc="XGRAPH is a general purpose x-y data plotter with interactive buttons for panning, zooming, printing, and selecting display options."
arch=('i686' 'x86_64')
url="http://www.xgraph.org/"
license=('custom')
depends=('libx11')
optdepends=('netpbm')
conflicts=('xgraph')
source_i686=("http://www.xgraph.org/linux/xgraph_4.30_linux32.tar.gz")
source_x86_64=("http://www.xgraph.org/linux/xgraph_4.30_linux64.tar.gz")
sha256sums_i686=('3f40da078c83f2ee8928211864f6aad000c833c63ffacc15b933d557695a084f')
sha256sums_x86_64=('4c7dd6468fb310899d4adc7b9f4dda4c329ac6f9a3bc7051fde307fa8878567b')

package() {
	if test "$CARCH" == x86_64; then
		_folder="XGraph4.30_linux64"
	elif test "$CARCH" == i686; then
		_folder="XGraph4.30_linux64"
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
