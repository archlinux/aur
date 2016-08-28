# Maintainer: PhotonX <photon89 [at] gmail.com>.

pkgname=xfce4-multiload-ng-plugin
_pkgname=multiload-ng
pkgver=1.1.0
pkgrel=1
pkgdesc='A modern graphical system monitor, Xfce version'
arch=('i686' 'x86_64')
url='https://udda.github.io/multiload-ng/'
license=('GPL2')
depends=('xfce4-panel' 'libxfce4util' 'libxfce4ui' 'gtk2' 'cairo' 'libgtop')
source=('https://github.com/udda/multiload-ng/archive/v1.1.0.tar.gz')
md5sums=('7004a5857f0d1a4777b6810ed6cdbb15')

build() {
	cd "$_pkgname-$pkgver"
	 ./autogen.sh
	 ./configure --prefix=$pkgdir/usr --with-gtk=2.0
	 make
} 

package() {
	cd "$_pkgname-$pkgver"
	make install
}