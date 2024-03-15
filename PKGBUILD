# Maintainer : Kitestramuort <kitestramuort@autistici.org>

pkgname=stc-coda
pkgver=2.25.2
pkgrel=1
pkgdesc="The Common Data Access toolset"
arch=('x86_64')
url="https://www.stcorp.nl"
license=('BSD')
depends=('python' 'hdf4' 'hdf5' 'java-environment')
provides=('hdf-coda')
source=("https://github.com/stcorp/coda/releases/download/${pkgver}/coda-${pkgver}.tar.gz")
md5sums=('9053984fe6b047956b00f584820fc905')


build() {
    cd coda-${pkgver}
    ./configure --prefix=/usr --libdir=/usr/lib --enable-java --enable-python --with-hdf5 --with-hdf4=/opt/hdf4
    make
}

package() {
	cd coda-$pkgver
	make DESTDIR=${pkgdir} install
    	install -Dm 644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}"
}

