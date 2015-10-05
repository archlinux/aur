# Contributor: sora <veltlion@foxmail.com>

pkgname=kde-thumbnailer-epub
pkgver=1.0.9
pkgrel=1
pkgdesc="Thumbnailer to show ePub cover previews in KDE file managers."
arch=('x86_64' 'i686')
url="http://kde-apps.org/content/show.php/KDE+ePub+Thumbnailer?content=151210"
depends=('kio')
makedepends=('cmake' 'extra-cmake-modules')
license=('GPL')
source=("http://kde-apps.org/CONTENT/content-files/151210-${pkgname}-${pkgver}.tar.gz")
md5sums=('d833dd20370533c80466f27e98035f6d')
build() {
	install -d "$pkgname-$pkgver"/build
	cd "$pkgname-$pkgver"/build
	cmake -DKDE_INSTALL_USE_QT_SYS_PATHS=ON -DCMAKE_INSTALL_PREFIX=`kf5-config --prefix` ..
        make
}

package() {
	make -C "$pkgname-$pkgver"/build DESTDIR="${pkgdir}" install
}
