# Maintainer: DriverX <thegio.f [at] gmail [dot] com>
# Contributor: Cedric Girard <girard.cedric@gmail.com>
# Contributor: kevku <kevku@gmx.com>

pkgname=kodi-addon-inputstream-adaptive
pkgver=2.3.15
pkgrel=1
pkgdesc='InputStream client for adaptive streams for Kodi 18+'
arch=('x86_64' 'i686' 'armv7h')
url='https://github.com/peak3d/inputstream.adaptive'
license=('GPL2')
depends=('kodi>=18' 'expat')
makedepends=('kodi-dev>=18' 'cmake')
source=("https://github.com/peak3d/inputstream.adaptive/archive/${pkgver}.tar.gz")
sha512sums=('74dba29e6b9982257a4156416331fbaf189ef54c04c4f3b8d87dd1fea703ed29e70ff58f52af35735e3fea31f7a84127c34211cb5f6a11f1ba1d8c6586464fd3')


build() {
	cd "$srcdir"/inputstream.adaptive-${pkgver}
	cmake -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir"/inputstream.adaptive-${pkgver}
	make DESTDIR="$pkgdir/" install
}
