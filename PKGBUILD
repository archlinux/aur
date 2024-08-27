# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: GI_Jack <GI_Jack@hackermail.com>

pkgname=flcluster
pkgver=1.1.0
pkgrel=2
pkgdesc="Amateur (Ham) Radio program for accessing dxcluster nodes."
arch=('x86_64' 'i686')
url="http://www.w1hkj.com/flcluster-help/"
license=('GPL-2.0-or-later')
depends=('hamlib' 'fltk' 'libjpeg' 'portaudio' 'flxmlrpc' 'libsamplerate'
	 'libsndfile' 'pulse-native-provider' 'xmlrpc-c' 'hamradio-menus')
optdepends=('fldigi: Intergrate with fldigi')
source=("http://www.w1hkj.com/files/flcluster/flcluster-${pkgver}.tar.gz")

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
md5sums=('db4dd756e792c94a25ec4ad267a79430')
sha256sums=('b18911de5108102627a4eee5cd33c3e3aae409088d6fc47312b41f35b8acf2a7')
