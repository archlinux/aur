# Maintainer : Kitestramuort <kitestramuort@autistici.org>

pkgname=stc-coda
pkgver=2.24
pkgrel=1
pkgdesc="The Common Data Access toolset"
arch=('x86_64')
url="https://www.stcorp.nl"
license=('BSD')
depends=('python' 'hdf4' 'java-environment')
provides=('hdf-coda')
source=("https://github.com/stcorp/coda/releases/download/${pkgver}/coda-${pkgver}.tar.gz")
md5sums=('b0bbb6aab6719e94db128126457fd8a2')


build() {
    cd coda-${pkgver}
    ./configure --prefix=/usr --libdir=/usr/lib --enable-java --enable-python --with-hdf5 --with-hdf4=/opt/hdf4
    make
}

package() {
	cd coda-$pkgver
	make DESTDIR=${pkgdir} install
	#install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
    	#install -Dm 644 "../src/coda-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}"
}

