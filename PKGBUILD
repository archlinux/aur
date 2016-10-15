# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=scmake
pkgver=0.1
pkgrel=1
license=('MIT')
pkgdesc="A simple build system"
arch=("i386" "x86_64")
url='https://github.com/SirCmpwn/scmake'
source=("https://github.com/SirCmpwn/scmake/archive/${pkgver}.tar.gz")
sha1sums=('37ec1376117de55a268202ab0caaac9969cfc208')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

    ./configure --prefix=/usr
    make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	DESTDIR="$pkgdir/usr/" make install
}
