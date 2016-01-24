# Maintainer: Branislav Holý <branoholy@gmail.com>
pkgname=regilo
pkgver=2.0
pkgrel=1
pkgdesc="A simple C++ library for controlling the Neato XV robot and the Hokuyo scanner"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/branoholy/$pkgname"
license=('GPL3')
depends=('boost>=1.54.0')
makedepends=('cmake>=2.8.0')
source=("https://github.com/branoholy/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        "https://github.com/branoholy/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.sig")
md5sums=('b49abe7229311bb7e2965274b875ad3e'
         'ade6bf2cea8ef4b0869663ac609c31a8')
sha1sums=('fc93dc4e3caf40908bc16d777bfff3003b928597'
          'd1ce7dd82b845c2ee02f3ee67161bab113591306')
sha256sums=('b62260c239c40f1ad1ca7815c1c1f37f1513e818da01af92a8795cbee28741f8'
            'f6b9a53753668baf9fa6542c563327c2324731212b8e0b606ddc9a4ab6261a81')
sha512sums=('ae1c9e4f572390e5a82069f151e4bdf3d478cc5fc17c78fb21e598545b5b1addaa98c0c87e24692260cb07de2a08c245cb378fb08b7ac6118a568eae077becb6'
            '24cbc0ebd0c9e5d6f844f95dc11ee6dd3562524a94064159b2db3b099b0926100f83f463d3b8c27635f56cb36166faac513deb5b6680a1cfcb4c8ca140a2e355')
validpgpkeys=('D25809BF3563AA56A12B0F4D545EDD46FBAC61E6')

build() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	cd build
	cmake -Dexample:bool=on -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$pkgname-$pkgver"
	cd build
	make DESTDIR="$pkgdir/" install
}
