#Contributor: Anton Bazhenov <anton.bazhenov at gmail>
#Contributor: Andreas W. Hauser <andy-aur@splashground.de>
#Maintainer: aksr <aksr at t-com dot me>
pkgname=mined
pkgver=2022.27
pkgrel=1
pkgdesc='A powerful text editor with a comprehensive and easy-to-use user interface and fast, small-footprint behaviour.'
arch=('i686' 'x86_64')
url="http://towo.net/mined/"
license=('GPL3')
depends=('desktop-file-utils')
install="${pkgname}.install"
source=("http://towo.net/mined/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('118d059f823d6989a5df2b1924b62deb')
sha1sums=('df07fa15c4b1c41ccb831586d71056e26d363c43')
sha256sums=('e55436c5a2c06a74ab12a46bc2bfdac2cb0cacbebd6bdd5f6c2f8aef8914d451')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="${pkgdir}" install
}
