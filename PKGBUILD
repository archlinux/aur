#Contributor: Anton Bazhenov <anton.bazhenov at gmail>
#Contributor: Andreas W. Hauser <andy-aur@splashground.de>
#Maintainer: aksr <aksr at t-com dot me>
pkgname=mined
pkgver=2015.25
pkgrel=1
pkgdesc="A powerful text editor with a comprehensive and easy-to-use user interface and fast, small-footprint behaviour."
arch=('i686' 'x86_64')
url="http://towo.net/mined/"
license=('GPL3')
depends=('desktop-file-utils')
install="${pkgname}.install"
source=("http://towo.net/mined/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('92c25368a0d81d1cc2aa01b46742a28e')
sha1sums=('bdfac26d3939bbcd7a10b9df1bff80dd664b986b')
sha256sums=('51bca986a9fe49bbce1e41e77dd48591dc775ed93f76f97702a3a73b7ffa67e6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}

