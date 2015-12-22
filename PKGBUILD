# Maintainer: Branislav Holý <branoholy@gmail.com>
pkgname=neatoc
pkgver=1.0.2
pkgrel=1
pkgdesc="A simple C++ library for communication with the Neato XV robot"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/branoholy/neatoc"
license=('GPL3')
depends=('boost>=1.54.0')
makedepends=('cmake>=2.8.0')
source=("https://github.com/branoholy/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        "https://github.com/branoholy/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.sig")
md5sums=('bf2e7c8c5d5df511979833d833784779'
         '3470d8662d5fa93add5f925c0d12b7e7')
sha1sums=('1266ac2a93487abb4647d79f6d3747d88bd6aeb3'
          'ae16db83b0caf0d57cbc8dc40dd969b7d6fa172e')
sha256sums=('3b48a4290cf533e5fa448b53a9a83d4fc5cf3ada4b4a69fe951430a88bc301cf'
            '8c7dcaedb33ed467801bc1fc8a59e4e60fe78a7ffee522aaf9dc03034df0d045')
sha512sums=('8e7e1bf0d81ce5c3d206e6975df7e27950b6b43691e622cc0c6ea949aaed3a7838202d59b8193c571bb385c98e9b5f06aaf0ea3435c636ac31081dba3dd22b4f'
            '48af421a77b7bc82c4d0fbdf45dceac0022ce154ec66d3cf6665a74b525d36bc40e09e9bfbba526d36b5451cbf61f54bfce889bc72a804faec3ea31b736c80b0')
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
