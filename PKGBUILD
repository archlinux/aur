# Maintainer: Branislav Holý <branoholy@gmail.com>
pkgname=neatoc
pkgver=1.0.1
pkgrel=2
pkgdesc="A simple C++ library for communication with the Neato XV robot"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/branoholy/neatoc"
license=('GPL3')
depends=('boost>=1.54.0')
makedepends=('cmake>=2.8.0')
source=("https://github.com/branoholy/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        "https://github.com/branoholy/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.sig")
md5sums=('9d3707fa578f9c8ae68c81247a64140d'
         '680a72d73e96bf9668ef1a91a65d2cfd')
sha1sums=('b484d3f71fe91572b681174a579c3cc055228108'
          '87a6c9888b8ec0c2dbc1b70a80e83f6e38fca135')
sha256sums=('9daf56b4650341f61633078ef05775bdfe4543bdeb065bc96367dde6411c4485'
            '9b84d2698661bc2d93fb884ef4ca76e2db9e1769ffc305084e8670c822d50cfd')
sha512sums=('71f31c4ea6ab12dc9161fc5d6b9394378888c39b97f6b007e310987163d6674c9300e19ebc60ea05ee63c58cc6c1d8a1076db9cccc9173d26ad06894d92a3518'
            'c2475da803b920e6fef5e329ca52678f73e59050e984bdfe6bcfd88ce4ab59b99e45cf5369d2e70d4eba3ae46c9803702538fca5404d7bca7e4d846e5fb27efe')
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
