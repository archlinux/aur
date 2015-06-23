 # Contributor: sxe <sxxe at gmx dot de>

pkgname=auroraedesigner
pkgver=0.3.1
pkgrel=2
pkgdesc="An application to preview KWin Aurorae themes and edit the configuration."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php?content=122763"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
source=(http://kde-apps.org/CONTENT/content-files/122763-$pkgname-$pkgver.tar.gz)
md5sums=('3485309b694b9922209bb99998992866')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    cmake ../auroraedesigner-$pkgver -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR=$pkgdir install
}