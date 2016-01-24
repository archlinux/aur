# Maintainer: Branislav Holý <branoholy@gmail.com>
pkgname=neatoc
pkgver=1.1
pkgrel=1
pkgdesc="A simple C++ library for communication with the Neato XV robot and the Hokuyo scanner"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/branoholy/neatoc"
license=('GPL3')
depends=('boost>=1.54.0')
makedepends=('cmake>=2.8.0')
source=("https://github.com/branoholy/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        "https://github.com/branoholy/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.sig")
md5sums=('164ccefe459a5f58c20fccc142dd21e6'
         'c7cfc323c935e79b01569de15ebf3fa9')
sha1sums=('6adc179cbeabc3cc7be092d774c1d5a3b8e4866f'
          'fc8781b0189df2c6d43a6894d13b8caa155432ee')
sha256sums=('3959785dd0b2f9188943bb7afec65aa62f8c24c5104df43b529aa93fe0d1516b'
            'aae3ed1bcb280cd58d7e5baa732afe2356de88e5c16d2558df4da1d080f86755')
sha512sums=('4560b0bcc365ebc20f24e978970988e23846533e0cc711aa9b68b755999c46253d2363164f21c1d51f247a61edd7c6ce18039c462eb57e995e307c709bd8a36f'
            '3769a25cf78636d92e4a31224add909b15b74645eb1dbe8ca9010cfb501646f2a19fc48f0fee92a9d1942fb3e9bce30ae1377324c85b9282c66a7087ebd27639')
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
