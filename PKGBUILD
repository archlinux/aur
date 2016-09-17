# Maintainer: PhotonX <photon89 [at] gmail.com>.
# Contributor: craigacgomez

pkgname=xfce4-multiload-ng-plugin
_pkgname=multiload-ng
pkgver=1.3.0
pkgrel=1
pkgdesc='A modern graphical system monitor, Xfce version'
arch=('i686' 'x86_64')
url='https://udda.github.io/multiload-ng/'
license=('GPL2')
depends=('xfce4-panel' 'libxfce4util' 'libxfce4ui' 'gtk2' 'cairo' 'libgtop')
source=("https://github.com/udda/multiload-ng/archive/v$pkgver.tar.gz")
md5sums=('f44757c42039ea422df5a94a06574e26')

build() {
	cd "$_pkgname-$pkgver"
	 ./autogen.sh
	 ./configure --prefix=/usr --with-gtk=2.0
	 make
} 

package() {
	cd "$_pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}