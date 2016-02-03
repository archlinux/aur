# Maintainer: Branislav Holý <branoholy@gmail.com>
pkgname=regilo
pkgver=2.1
pkgrel=2
pkgdesc="A simple C++ library for controlling the Neato XV robot and the Hokuyo scanner"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/branoholy/$pkgname"
license=('GPL3')
depends=('boost>=1.54.0')
makedepends=('cmake>=2.8.0')
source=("https://github.com/branoholy/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        "https://github.com/branoholy/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.sig")
md5sums=('a9b3b4453672b9b51e422051a5b0785c'
         'f4b5c7a26ac3300f786392336f83049d')
sha1sums=('e83df657080781ec2340e50ead789ba8b5745c15'
          'b8f161c73d816f071e45af762f5000b43b0731bc')
sha256sums=('8c941bccd23503323f2467d78ce3902c095e614950b9e92e83d042d5ad7f5cb0'
            '2a5b8114fb54b15276a098988b8ba088c23c11d52eab4d926984b8e384a27bcf')
sha512sums=('619b1352718065f926254bbbef56571a9dd49ce05af6c1613564152f18cae1c2e4318e90b5c9a3d65054f43a3dc820b4b8510fff07a0fbba14eddaf98f89222f'
            'c02b2e2e29f4b779b1686d4b7a34e90160bb409947d26a7e65e668b4ac50fee19d83eb11c430569cbc0ca84a57ce554aa4d93131d0c9b212c350b43195d3b103')
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
