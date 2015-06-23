#Contributor: sxe <sxxe@gmx.de>

pkgname=ffmpegthumbs-mattepaint
pkgver=0.4
pkgrel=2
pkgdesc="An alternative version of the standard KDE ffmpegthumbs."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/FFMpegThumbs-MattePaint?content=153902"
depends=('kdebase-workspace>=4.3.0')
makedepends=('cmake' 'automoc4' 'gcc')
source=("http://kde-look.org/CONTENT/content-files/153902-${pkgname}-${pkgver}.tar.gz")
license=('GPL')
md5sums=('89398e47e3290bbc02893bcca82a8ae8')

build() {
        cd $srcdir/${pkgname}-${pkgver}
        cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=Release .
        make
}

package() {
        cd $srcdir/${pkgname}-${pkgver}
        make DESTDIR=$pkgdir install
	kbuildsycoca4
}

