# Maintainer: Ben Westover <kwestover [dot] kw [at] gmail [dot] com>

pkgname='hddcash-qt'
pkgver=0.16.14
pkgrel=1
commit=f8ebe58
arch=('x86_64')
url="https://hdd.cash"
license=('MIT')
source=("https://www.hdd.cash/download/hddcash-v$pkgver.0-$commit-x86_64-linux-gnu.tar.gz"
        "hddcash-qt.desktop"
        "hdd-qt.sh"
        "hddcash128.png")
sha256sums=('86dd44cc85b63449cec7a8d3ff5cee2a341b2a9ed739139acf05caad5a0b66ca'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
	pkgdesc="HDDCash is a peer-to-peer network based digital currency"
	depends=(boost-libs libevent qt5-base miniupnpc libminiupnpc.so qrencode protobuf zeromq)

	install -Dm755 hddcash-v$pkgver/bin/hddcash-qt $pkgdir/usr/bin/hddcash-qt
	install -Dm644 hddcash-v$pkgver/share/man/man1/hddcash-qt.1 $pkgdir/usr/share/man/man1/hddcash-qt.1

	install -Dm644 hddcash128.png $pkgdir/usr/share/pixmaps/hddcash128.png
	install -Dm755 hdd-qt.sh $pkgdir/usr/local/bin/hdd-qt
	install -Dm644 hddcash-qt.desktop $pkgdir/usr/share/applications/hddcash-qt.desktop

	mkdir -p $pkgdir/usr/lib/hddcash
	cp -r hddcash-v$pkgver/lib/* $pkgdir/usr/lib/hddcash
}
