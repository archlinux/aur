# Maintainer: Branislav Holý <branoholy@gmail.com>
pkgname=neatoc
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple C++ library for communication with the Neato XV robot"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/branoholy/neatoc"
license=('GPL3')
depends=('boost>=1.54.0')
makedepends=('cmake>=2.8.0')
source=("https://github.com/branoholy/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        "https://github.com/branoholy/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.sig")
md5sums=('9d3707fa578f9c8ae68c81247a64140d'
         'd6f1e2fdbedd155cb841977730c19a20')
sha1sums=('b484d3f71fe91572b681174a579c3cc055228108'
          '0d23bf155164e7d04eedaad4347ff96ce1d9ffe9')
sha256sums=('9daf56b4650341f61633078ef05775bdfe4543bdeb065bc96367dde6411c4485'
            '68bef45751e7eb11813d254eec94ed7076b96269b6a05727edbd0f99b27d3636')
sha512sums=('71f31c4ea6ab12dc9161fc5d6b9394378888c39b97f6b007e310987163d6674c9300e19ebc60ea05ee63c58cc6c1d8a1076db9cccc9173d26ad06894d92a3518'
            '55f94484b80ffb8206bea7f9353053e905a4a5195c7747ca84669c2ffa6b5744fecb49aabc019212cadb504d68a244bf78a1de155263499ea6a2f1a5913555d0')
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
