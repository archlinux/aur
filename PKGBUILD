# Maintainer: Branislav Holý <branoholy@gmail.com>
pkgname=neatoc
pkgver=1.0
pkgrel=2
pkgdesc="A simple C++ library for communication with the Neato XV robot"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/branoholy/neatoc"
license=('GPL3')
depends=('boost>=1.54.0')
makedepends=('cmake>=2.8.0')
source=("https://github.com/branoholy/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        "https://github.com/branoholy/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.sig")
md5sums=('cfa2ccdbfb583d0aacb1d48d91afea74'
         'eaa2c1d1385b0301fa37440b8ccf2b32')
sha1sums=('c490bba8ca56f26fccb1e9be9eaf8acc6679d1aa'
          'f0a88155cd287701248038be83b06f9ba42e0208')
sha256sums=('42297eea8edc4f36354fa01f8989e584ab183dc89b8841c73e8bf3b6e9c03dd6'
            '28252c613934ac4fb4f39329739bf039270038bf1a25f67e7af5c89a1bd1af67')
sha512sums=('27d06047343c71a6529d60b8d4049b7eaa9e442287348245b14bc69e2144adb41b409d9f418698fb8d3bc13cc74bf2d9d1c0d32ff2f756730292c713c926dd28'
            '94a8fcc24567fb1c62a5f46922e144ac8839d95f130facebd87bd6bdc9fc1611850ffbbcce8e1840931795d1813cc62c024f8e7476ea91a2728fe9fec7c0a379')
validpgpkeys=('D25809BF3563AA56A12B0F4D545EDD46FBAC61E6')

build() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$pkgname-$pkgver"
	cd build
	make DESTDIR="$pkgdir/" install
}
