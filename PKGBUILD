# Maintainer: Branislav Holý <branoholy@gmail.com>
pkgname=regilo
pkgver=2.1
pkgrel=1
pkgdesc="A simple C++ library for controlling the Neato XV robot and the Hokuyo scanner"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/branoholy/$pkgname"
license=('GPL3')
depends=('boost>=1.54.0')
makedepends=('cmake>=2.8.0')
source=("https://github.com/branoholy/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        "https://github.com/branoholy/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.sig")
md5sums=('a9b3b4453672b9b51e422051a5b0785c'
         '59858417b3cca8960aab2f97fc12c4ef')
sha1sums=('e83df657080781ec2340e50ead789ba8b5745c15'
          'a036a0e915e85850d08706003127261facf8d5df')
sha256sums=('8c941bccd23503323f2467d78ce3902c095e614950b9e92e83d042d5ad7f5cb0'
            'cd940e437bb1a6e4efb598cdf7456aa50dd4eabd712d6deca627d262ad36fc06')
sha512sums=('619b1352718065f926254bbbef56571a9dd49ce05af6c1613564152f18cae1c2e4318e90b5c9a3d65054f43a3dc820b4b8510fff07a0fbba14eddaf98f89222f'
            '81fd9be58da226e72586fe446fd2e92da26a19172646c30c679f1490108d8b780bcae25e8e781f3845c9fa52bb1e7566a89187f202d175b2ef26206e5a49909d')
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
